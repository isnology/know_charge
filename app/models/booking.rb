class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :charge_station
end
