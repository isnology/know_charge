module BookingsHelper
  
  def station_bookings(booking)
    booking.charge_station.user == current_user ? 'my-station' : ''
  end
  
end
