# frozen_string_literal: true

class Multiplication < Problem
  def correct?(answer)
    number_1 * number_2 == answer.text.to_i
  end
end
