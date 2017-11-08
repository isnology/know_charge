class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :charge_station, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
