# frozen_string_literal: true

class RenameCardSessionUserToCardSessionProblem < ActiveRecord::Migration[6.0]
  def change
    rename_table :card_session_users, :card_session_problems
  end
end
