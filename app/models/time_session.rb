# frozen_string_literal: true

class TimeSession < ApplicationRecord
  belongs_to :user
  has_many :answers_sessions, dependent: :destroy
  has_many :answers, through: :answers_sessions

  validates_presence_of :minutes

  def next_problem
    return Problem.operation_types.sample.random(user) if operation_types.blank?

    Oj.load(operation_types).sample.capitalize.constantize.random(user)
  end

  def ended?
    Time.zone.now > created_at + minutes.minutes
  end

  def answered_count
    answers.answered.count
  end

  def correct_rate
    answers.correct.count.to_f * 100 / answered_count
  end
end
