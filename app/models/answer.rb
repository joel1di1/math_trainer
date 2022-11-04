# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  belongs_to :card_session, optional: true

  validates_presence_of :user, :problem
  validate :only_one_answer, on: :update

  before_update :set_correctnes!

  scope :answered, -> { where.not(text: nil) }
  scope :correct, -> { where(correct: true) }

  def correct?
    problem.correct?(self)
  end

  def only_one_answer
    errors.add(:text, "Answer #{id} already answered #{updated_at}") if text_was.present?
  end

  protected

  def set_correctnes!
    self.correct = correct?
  end
end
