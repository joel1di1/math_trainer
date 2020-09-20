# frozen_string_literal: true

class CardSession < ApplicationRecord
  belongs_to :user, optional: true
  has_many :card_session_problems, inverse_of: :card_session
  has_many :problems, through: :card_session_problems

  def self.build_addition(range:)
    card_session = CardSession.new
    range_as_array = get_range_as_array(range)
    card_session.problems = range_as_array.map do |number|
      (0..10).map do |number_2|
        Addition.find_or_create_by!(number_1: number, number_2: (1..10).to_a.sample, hole_position: [nil, 1, 2].sample)
      end
    end.flatten
    card_session
  end

  def self.get_range_as_array(range)
    [*range]
  end
end
