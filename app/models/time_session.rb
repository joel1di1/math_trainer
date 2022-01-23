# frozen_string_literal: true

class TimeSession < ApplicationRecord
  belongs_to :user

  def next_problem
    return Problem.operation_types.sample.random(user) if operation_types.blank?

    Oj.load(operation_types).sample.capitalize.constantize.random(user)
  end

  def ended?
    Time.zone.now > created_at + minutes.minutes
  end
end
