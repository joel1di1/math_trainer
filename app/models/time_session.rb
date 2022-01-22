# frozen_string_literal: true

class TimeSession < ApplicationRecord
  belongs_to :user

  def next_problem
    Problem.new
  end
end
