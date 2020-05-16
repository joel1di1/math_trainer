# frozen_string_literal: true

class Problem < ApplicationRecord
  def correct?(_answer)
    raise "correct? not implemented for #{self.class}."
  end
end
