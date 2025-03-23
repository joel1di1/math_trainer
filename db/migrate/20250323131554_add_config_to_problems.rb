# frozen_string_literal: true

class AddConfigToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :config, :jsonb
  end
end
