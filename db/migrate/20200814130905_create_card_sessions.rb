# frozen_string_literal: true

class CreateCardSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :card_sessions do |t|
      t.string :title
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
