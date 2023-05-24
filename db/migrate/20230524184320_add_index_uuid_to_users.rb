# frozen_string_literal: true

class AddIndexUuidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :uuid, unique: true
  end
end
