# frozen_string_literal: true

class Fight < ApplicationRecord
  belongs_to :fight_opponent
  belongs_to :user

  has_many :answer_fights, dependent: :destroy
  has_many :answers, through: :answer_fights

  def next_problem
    return Problem.operation_types.sample.random(user) if fight_opponent.operation_types.blank?

    operation_name, params = fight_opponent.operation_types.entries.sample
    operation = operation_name.capitalize.constantize

    number_1 = params['table_numbers'].sample.to_i
    number_2 = flatten_frequencies(params['frequencies']).sample.to_i

    operation.random(user, number_1, number_2, shuffle_hole_position: true)
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
      frequencies: (1..10).to_a.index_with { |_i| (1..10).to_a.sample } }
  end

  def round_ended?
    Time.zone.now > updated_at + round_duration.seconds
  end
end
