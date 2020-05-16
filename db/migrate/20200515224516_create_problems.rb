# frozen_string_literal: true

class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.integer :number_1
      t.integer :number_2
      t.integer :hole_position

      t.timestamps
    end
  end
end
