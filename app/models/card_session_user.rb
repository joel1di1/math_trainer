class CardSessionUser < ApplicationRecord
  belongs_to :problem
  belongs_to :card_session
end
