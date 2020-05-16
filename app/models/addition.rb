# frozen_string_literal: true

class Addition < Problem
  def correct?(answer)
    number_1 + number_2 == answer.text.to_i
  end
end
