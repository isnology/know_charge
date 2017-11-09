class CreateChargeSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :charge_sessions do |t|
      t.references :action, foreign_key: true
      t.time :time
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
