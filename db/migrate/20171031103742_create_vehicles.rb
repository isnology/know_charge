class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :licence_plate
      t.string :make
      t.string :model
      t.string :colour
      t.float :charger_kwh
      t.string :drivers_licence_number
      t.text :image_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
