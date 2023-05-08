class RemoveFrequenciesFromTimeSession < ActiveRecord::Migration[7.0]
  def change
    remove_column :time_sessions, :frequencies, :text
  end
end
