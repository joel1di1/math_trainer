# frozen_string_literal: true

class Problem < ApplicationRecord
  def self.operation_types
    @operation_types ||= [Multiplication, Division, Addition, Soustraction]
  end

  def self.operation_types_s
    @operation_types_s ||= operation_types.map(&:to_s)
  end

  def self.random_with_frequency(frequency_array)
    frequency_array.reduce([]) do |array, frequence|
      array.concat(Array.new(frequence.first, frequence.second))
    end.sample
  end

  def correct?(_answer)
    raise "correct? not implemented for #{self.class}."
  end

  def create_answer!(user, card_session: nil)
    Answer.create!(user:, problem: self, card_session:)
  end
end
