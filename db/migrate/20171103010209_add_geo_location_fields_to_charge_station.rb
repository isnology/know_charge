class AddGeoLocationFieldsToChargeStation < ActiveRecord::Migration[5.1]
  def change
    add_column :charge_stations, :latitude, :float
    add_column :charge_stations, :longitude, :float
  end
end
