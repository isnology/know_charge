class AddAddressReferenceToProfileAndChargeStation < ActiveRecord::Migration[5.1]
  def up
    add_reference :profiles, :address, foreign_key: true
    add_reference :charge_stations, :address, foreign_key: true

    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float
    
    Profile.find_each do |rec|
      address = Address.create!(number: rec.street_number,
                                street: rec.street,
                                city: rec.city,
                                state: rec.state,
                                postcode: rec.postcode,
                                country: 'Australia'
      )
      rec.address = address
      rec.save
    end
    ChargeStation.find_each do |rec|
      address = Address.create!(number: rec.street_number,
                                street: rec.street,
                                city: rec.city,
                                state: rec.state,
                                postcode: rec.postcode,
                                country: 'Australia'
      )
      rec.address = address
      rec.save
    end
    
    remove_column :profiles, :street_number
    remove_column :profiles, :street
    remove_column :profiles, :city
    remove_column :profiles, :state
    remove_column :profiles, :postcode

    remove_column :charge_stations, :street_number
    remove_column :charge_stations, :street
    remove_column :charge_stations, :city
    remove_column :charge_stations, :state
    remove_column :charge_stations, :postcode
  end
  
  def down
    add_column :profiles, :street_number
    add_column :profiles, :street
    add_column :profiles, :city
    add_column :profiles, :state
    add_column :profiles, :postcode
  
    add_column :charge_stations, :street_number
    add_column :charge_stations, :street
    add_column :charge_stations, :city
    add_column :charge_stations, :state
    add_column :charge_stations, :postcode
    
    ChargeStation.find_each do |rec|
      rec.street_number =  rec.address.street
      rec.street = rec.address.street
      rec.city = rec.address.city
      rec.state = rec.address.state
      rec.postcode = rec.address.postcode
      rec.save
    end
    Profile.find_each do |rec|
      rec.street_number =  rec.address.street
      rec.street = rec.address.street
      rec.city = rec.address.city
      rec.state = rec.address.state
      rec.postcode = rec.address.postcode
      rec.save
    end
    
    remove_reference :charge_stations, :adddress, index: true, foreign_key: true
    remove_reference :profiles, :adddress, index: true, foreign_key: true
  end
end
