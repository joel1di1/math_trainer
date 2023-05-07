# frozen_string_literal: true

class Addition < Problem
  FREQUENCIES = [
    [1, 0],
    [1, 1],
    [3, 2],
    [3, 3],
    [3, 4],
    [3, 5],
    [6, 6],
    [6, 7],
    [6, 8],
    [6, 9],
    [2, 10]
    # [3, 11],
    # [3, 12],
    # [3, 13],
    # [3, 14],
    # [3, 15],
    # [3, 16],
    # [3, 17],
    # [3, 18],
    # [3, 19],
    # [3, 20]
  ].freeze

  def self.random(_user, number_1 = nil, number_2 = nil)
    number_1 ||= random_with_frequency(FREQUENCIES)
    number_2 ||= random_with_frequency(FREQUENCIES)

    number_1, number_2 = number_2, number_1 if Random.random_number * 2 > 1

    Addition.find_or_create_by!(number_1:, number_2:, hole_position: [nil, 1, 2].sample)
  end

  def correct?(answer)
    case hole_position
    when 1
      number_1 == answer.text.to_i
    when 2
      number_2 == answer.text.to_i
    else
      number_1 + number_2 == answer.text.to_i
    end
  end
end
