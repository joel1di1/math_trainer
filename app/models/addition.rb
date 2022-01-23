# frozen_string_literal: true

class Addition < Problem
  FREQUENCIES = [
    [1, 0],
    [1, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [4, 5],
    [6, 6],
    [6, 7],
    [6, 8],
    [6, 9],
    [44, 10]
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

  def self.random(_user)
    number_1 ||= FREQUENCIES.reduce([]) do |array, frequence|
      array + [frequence.first, frequence.second]
    end.sample
    number_2 ||= FREQUENCIES.reduce([]) do |array, frequence|
      array + [frequence.first, frequence.second]
    end.sample

    number_1, number_2 = number_2, number_1 if [true, false].sample

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
