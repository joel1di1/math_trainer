class AddCardSessionToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :card_session, null: true, foreign_key: true
  end
end
