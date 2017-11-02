class CreateAdapterPlugs < ActiveRecord::Migration[5.1]
  def change
    create_table :adapter_plugs do |t|
      t.references :adapter, foreign_key: true
      t.references :charge_station, foreign_key: true

      t.timestamps
    end
  end
end
