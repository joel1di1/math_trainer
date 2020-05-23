# frozen_string_literal: true

class Problem < ApplicationRecord
  def self.random_with_frequency(frequency_array)
    frequency_array.reduce([]) do |array, frequence|
      array.concat(Array.new(frequence.first, frequence.second))
    end.sample
  end

  def correct?(_answer)
    raise "correct? not implemented for #{self.class}."
  end

  def create_answer!(user)
    Answer.create!(user: user, problem: self)
  end
end
