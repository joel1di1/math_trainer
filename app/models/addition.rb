# frozen_string_literal: true

class Addition < Problem
  def self.random(_user)
    number2_freq_array = [
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
      [6, 10],
      [3, 11],
      [3, 12],
      [3, 13],
      [3, 14],
      [3, 15],
      [3, 16],
      [3, 17],
      [3, 18],
      [3, 19],
      [3, 20]
    ]

    number_1 ||= number2_freq_array.reduce([]) { |array, frequence| array += Array.new(frequence.first, frequence.second) }.sample
    number_2 ||= number2_freq_array.reduce([]) { |array, frequence| array += Array.new(frequence.first, frequence.second) }.sample

    if [true, false].sample
      tmp = number_1
      number_1 = number_2
      number_2 = tmp
    end

    Addition.find_or_create_by!(number_1: number_1, number_2: number_2, hole_position: [nil, 1, 2].sample)
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
