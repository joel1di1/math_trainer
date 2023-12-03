# frozen_string_literal: true

class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :fight_opponent, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :remaining_player_health
      t.integer :remaining_opponent_health
      t.integer :round_duration
      t.string :name

      t.timestamps
    end
  end
end
