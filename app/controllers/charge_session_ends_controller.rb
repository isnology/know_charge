class ChargeSessionEndsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:new, :create]
  
  def new
    @charge_session_name = "#{@booking.charge_station.address.small_address} - #{@booking.vehicle.licence_plate}"
    start_time, end_time = ChargeSession.set_times(@booking)
    if start_time.nil?
      redirect_to new_charge_session_start_path(id: @booking.id), notice: 'Charge session not started'
    elsif start_time.present? && end_time.present?
      redirect_to payment_path(id: @booking.id), notice: 'Payment complete'
    end
  end

  def create
    @charge_session_name = "#{@booking.charge_station.address.small_address} - #{@booking.vehicle.licence_plate}"
    start_time, end_time = ChargeSession.set_times(@booking)
    if start_time.present? && end_time.nil?
      @charge_session = ChargeSession.new(action_id: ChargeSession::END_CHARGE, time: Time.now, booking: @booking)
      if @charge_session.save
        update_booking(@booking)
      end
    elsif start_time.present? && end_time.present?
      update_booking(@booking)
    end
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(:id)
    end
  
    def update_booking(booking)
      start_time, end_time = ChargeSession.set_times(booking)
      seconds = end_time - start_time
      hours = 0.0
      hours = (seconds / 3600).to_f
      v_kwh = booking.vehicle.charger_kwh
      c_kwh = booking.charge_station.charge_kwh
      kwh = c_kwh < v_kwh ? c_kwh : v_kwh
      payment = (booking.charge_station.price_kwh_cents * hours * kwh).to_i
      if booking.update_attributes!(price_cents: payment)
        redirect_to payment_path(id: booking.id), notice: 'Charge session was successfully completed.'
      else
        render charge_sessions_path(id: booking.id), notice: 'Unable to update Booking record with completed price.'
      end
    end

end
