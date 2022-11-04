# frozen_string_literal: true

class CardSession < ApplicationRecord
  belongs_to :user, optional: true
  has_many :card_session_problems, inverse_of: :card_session
  has_many :problems, through: :card_session_problems
  has_many :answers, inverse_of: :card_session

  def self.build_addition(range:, user:)
    card_session = CardSession.create!(user:)
    range_as_array = get_range_as_array(range)
    card_session.problems = range_as_array.map do |number|
      (0..10).map do |_number_2|
        Addition.find_or_create_by!(number_1: number, number_2: (1..10).to_a.sample, hole_position: [nil, 1, 2].sample)
      end
    end.flatten
    card_session
  end

  def self.get_range_as_array(range)
    [*range]
  end

  def next
    problems.find do |problem|
      answers.where(problem:).where(correct: true).count < 1
    end
  end
end
