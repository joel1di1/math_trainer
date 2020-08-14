class CreateCardSessionUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :card_session_users do |t|
      t.references :problem, null: false, foreign_key: true
      t.references :card_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
