# frozen_string_literal: true

class AnswersSession < ApplicationRecord
  belongs_to :answer
  belongs_to :time_session
end
