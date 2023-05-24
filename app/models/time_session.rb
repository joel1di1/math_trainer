# frozen_string_literal: true

class TimeSession < ApplicationRecord
  belongs_to :user
  has_many :answers_sessions, dependent: :destroy
  has_many :answers, through: :answers_sessions

  attribute :shuffle_hole_position, :boolean, default: false

  validates_presence_of :minutes

  def next_problem
    return Problem.operation_types.sample.random(user) if operation_types.blank?

    operation_name, params = operation_types.entries.sample
    operation = operation_name.capitalize.constantize

    number_1 = params['table_numbers'].sample.to_i
    number_2 = flatten_frequencies(params['frequencies']).sample.to_i

    operation.random(user, number_1, number_2, shuffle_hole_position)
  end

  # frequencies is a map
  # result is an array of numbers where each number is repeated as many times as its frequency
  def flatten_frequencies(frequencies)
    results = []
    frequencies.each do |number, frequency|
      frequency.times do
        results << number
      end
    end
    results
  end

  def ended?
    Time.zone.now > created_at + minutes.minutes
  end

  def answered_count
    answers.answered.count
  end

  def correct_rate
    answers.correct.count.to_f * 100 / answered_count
  end

  def self.random_operation_type_values
    { table_numbers: (1..10).to_a.sample(2),
      frequencies: (1..10).to_a.to_h { |i| [i, (1..10).to_a.sample] } }
  end
end
