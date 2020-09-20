# frozen_string_literal: true

class CardSessionProblem < ApplicationRecord
  belongs_to :problem
  belongs_to :card_session
end
