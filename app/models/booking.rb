# == Schema Information
#
# Table name: bookings
#
#  id                :integer          not null, primary key
#  date              :date
#  time              :time
#  duration          :integer
#  price_cents       :integer
#  vehicle_id        :integer
#  charge_station_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :charge_station
  
  monetize :price_cents
  
end
