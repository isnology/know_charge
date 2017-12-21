class ChargeSessionStartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:new, :create]
  
  def new
    @charge_session_name = "#{@booking.charge_station.address.small_address} - #{@booking.vehicle.licence_plate}"
    start_time, end_time = ChargeSession.set_times(@booking)
    if start_time.present? && end_time.nil?
      redirect_to new_charge_session_end_path(id: @booking.id), notice: 'Charge session already started'
    elsif start_time.present? && end_time.present?
      redirect_to payment_path(id: @booking.id)
    end
  end

  def create
    @charge_session_name = "#{@booking.charge_station.address.small_address} - #{@booking.vehicle.licence_plate}"
    start_time, end_time = ChargeSession.set_times(@booking)
    if start_time.nil?
      @charge_session = ChargeSession.new(action_id: ChargeSession::START_CHARGE, time: Time.now, booking: @booking)
      if @charge_session.save
        redirect_to new_charge_session_end_path(id: @booking.id), notice: 'Charge session was successfully started.'
      else
        render charge_sessions_path(id: @booking.id), notice: 'Unable to add Session started record.'
      end
    end
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(:id, :price_cents)
    end
end
