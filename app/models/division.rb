# frozen_string_literal: true

class Division < Problem
  def self.random(_user)
    number2_freq_array = [
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4],
      [1, 5],
      [1, 6],
      [1, 7],
      [1, 8],
      [1, 9],
      [1, 10]
    ]

    number_1 ||= (2..9).to_a.sample
    number_2 ||= number2_freq_array.reduce([]) do |array, frequence|
      array += Array.new(frequence.first, frequence.second)
    end.sample
    product = number_1 * number_2

    if [true, false].sample
      tmp = number_1
      number_1 = number_2
      number_2 = tmp
    end

    Division.find_or_create_by!(number_1: product, number_2: number_2, hole_position: [nil, 1, 2].sample)
  end

  def correct?(answer)
    case hole_position
    when 1
      number_1 == answer.text.to_i
    when 2
      number_2 == answer.text.to_i
    else
      number_1 / number_2 == answer.text.to_i
    end
  end
end
