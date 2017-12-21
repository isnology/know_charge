class ChargeSessionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    vehicles = Vehicle.where(user: current_user)
    @charging_sessions = Booking.where(vehicle_id: vehicles).where(start_time: Date.today)
    @heading = @charging_sessions.count > 0 ? 'Todays Charge Sessions' : 'There are no Charge Sessions toady'
  end
  
end
