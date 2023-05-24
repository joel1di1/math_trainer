# frozen_string_literal: true

class TimeSessionOperationTypesInJsonb < ActiveRecord::Migration[7.0]
  def up
    remove_column :time_sessions, :operation_types # rubocop:disable Rails/BulkChangeTable
    add_column :time_sessions, :operation_types, :jsonb, default: {}
  end

  def down
    remove_column :time_sessions, :operation_types # rubocop:disable Rails/BulkChangeTable
    add_column :time_sessions, :operation_types, :text
  end
end
