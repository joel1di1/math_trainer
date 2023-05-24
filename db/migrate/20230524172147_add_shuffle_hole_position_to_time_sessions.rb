class AddShuffleHolePositionToTimeSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :time_sessions, :shuffle_hole_position, :boolean, default: false
  end
end
