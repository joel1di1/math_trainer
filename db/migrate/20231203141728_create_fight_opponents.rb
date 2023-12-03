# frozen_string_literal: true

class CreateFightOpponents < ActiveRecord::Migration[7.0]
  def change
    create_table :fight_opponents do |t|
      t.string :name
      t.integer :health
      t.integer :speed
      t.integer :color_rot
      t.jsonb :operation_types, default: {}

      t.timestamps
    end
  end
end
