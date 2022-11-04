# frozen_string_literal: true

class CreateAnswersSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :answers_sessions do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :time_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
