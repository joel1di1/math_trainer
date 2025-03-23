# frozen_string_literal: true

class ChainedAddition < Problem
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
  ].freeze

  def self.random(_user)
    number_1 ||= random_with_frequency(FREQUENCIES)
    number_2 ||= random_with_frequency(FREQUENCIES)
    number_3 ||= random_with_frequency(FREQUENCIES)

    ChainedAddition.find_or_create_by!(config: {
                                         number_1: number_1,
                                         number_2: number_2,
                                         number_3: number_3
                                       })
  end

  def correct?(answer)
    config['number_1'] + config['number_2'] + config['number_3'] == answer.text.to_i
  end
end
