class CreateTimeSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :time_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :minutes
      t.string :operation_types
      t.string :frequencies

      t.timestamps
    end
  end
end
