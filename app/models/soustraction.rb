# frozen_string_literal: true

class Soustraction < Problem
  FREQUENCY_ARRAY = [
    [1, 1],
    [1, 2],
    [3, 3],
    [3, 4],
    [3, 5],
    [6, 6],
    [6, 7],
    [6, 8],
    [4, 9],
    [1, 10]
  ].freeze

  def self.random(_user, number_1 = nil, number_2 = nil)
    number_1 ||= random_with_frequency(FREQUENCY_ARRAY)
    number_2 ||= random_with_frequency(FREQUENCY_ARRAY)

    number_1, number_2 = number_2, number_1 if number_2 > number_1

    Soustraction.find_or_create_by!(number_1:, number_2:, hole_position: [nil, 1, 2].sample)
  end

  def correct?(answer)
    case hole_position
    when 1
      number_1 == answer.text.to_i
    when 2
      number_2 == answer.text.to_i
    else
      number_1 - number_2 == answer.text.to_i
    end
  end
end
