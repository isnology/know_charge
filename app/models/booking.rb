class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :charge_station
  
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
