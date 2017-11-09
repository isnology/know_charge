class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.references :charge_station, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
