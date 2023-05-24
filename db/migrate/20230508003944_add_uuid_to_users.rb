# frozen_string_literal: true

class AddUuidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uuid, :uuid
  end
end
