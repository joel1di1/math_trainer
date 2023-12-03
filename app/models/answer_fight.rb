# frozen_string_literal: true

class AnswerFight < ApplicationRecord
  belongs_to :answer
  belongs_to :fight
end
