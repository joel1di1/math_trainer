# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  def correct?
    problem.correct?(self)
  end
end
