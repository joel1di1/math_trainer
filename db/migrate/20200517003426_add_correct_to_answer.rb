# frozen_string_literal: true

class AddCorrectToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean # rubocop:disable Rails/ThreeStateBooleanColumn
  end
end
