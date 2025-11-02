# frozen_string_literal: true

class ChangeUuidToStringInUsers < ActiveRecord::Migration[8.1]
  def up
    # Convert existing UUID values to strings and change column type
    change_column :users, :uuid, :string, using: 'uuid::text'
  end

  def down
    # Convert back to UUID type (this will fail if there are non-UUID strings)
    change_column :users, :uuid, :uuid, using: 'uuid::uuid'
  end
end
