# frozen_string_literal: true

class AddIndexUuidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :uuid, unique: true, name: 'index_math_trainer_index_users_on_uuid'
  end
end
