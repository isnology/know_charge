# == Schema Information
#
# Table name: bookings
#
#  id                :integer          not null, primary key
#  start_time        :date
#  name              :string
#  price_cents       :integer
#  vehicle_id        :integer
#  charge_station_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :charge_station
  has_many :favourites, dependent: :destroy
  
  validate :check_time_slot

  monetize :price_cents
  
  def time_slot
    self.name
  end
  
  private

    def check_time_slot
      bookings = Booking.where(charge_station_id: self.charge_station_id).where(start_time: self.start_time)
      slots = Hash.new(false)
      bookings.each { |booked| slots.store(booked.name, true) }
      errors.add(:time_slot, 'taken already') if slots[self.name]
    end
end
