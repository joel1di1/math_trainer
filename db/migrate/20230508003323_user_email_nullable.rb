# frozen_string_literal: true

class UserEmailNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, true
  end
end
