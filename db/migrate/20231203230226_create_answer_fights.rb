# frozen_string_literal: true

class CreateAnswerFights < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_fights do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :fight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
