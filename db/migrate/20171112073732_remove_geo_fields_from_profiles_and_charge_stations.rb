class RemoveGeoFieldsFromProfilesAndChargeStations < ActiveRecord::Migration[5.1]
  def change
    remove_column :charge_stations, :latitude
    remove_column :charge_stations, :longitude
    remove_column :profiles, :latitude
    remove_column :profiles, :longitude
  end
end
