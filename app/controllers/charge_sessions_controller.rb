class ChargeSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :create]
  
  def index
    vehicles = Vehicle.where(user: current_user)
    @charging_sessions = Booking.where(vehicle_id: vehicles).where(start_time: Date.today)
    @heading = @charging_sessions.count > 0 ? 'Todays Charge Sessions' : 'There are no Charge Sessions toady'
  end

  def show
    @charge_session_name = "#{@booking.charge_station.small_address} - #{@booking.vehicle.licence_plate}"
    start_time, end_time = set_times
    if start_time.nil?
      @action = 'start'
      @return = true
    else
      if start_time.present? && end_time.nil?
        @action = 'end'
      elsif start_time.present? && end_time.present?
        @action = 'pay'
        @payment = Payment.where(booking: @booking)
        total = @payment.inject(0) { |total, payment|  total + payment.price_cents }
        if total >= @booking.price_cents
          redirect_to charge_sessions_path(id: @booking.id), notice: 'Payment complete'
        end
        # Amount in cents
        @amount = @booking.price_cents - total
      end
    end
  end

  def create
    @charge_session_name = "#{@booking.charge_station.small_address} - #{@booking.vehicle.licence_plate}"
    begin_time, end_time = set_times
    if begin_time.nil?
      @charge_session = ChargeSession.new(action_id: 1, time: Time.now, booking: @booking)
      if @charge_session.save
        redirect_to charge_session_path(id: @booking.id), notice: 'Charge session was successfully started.' && return
      end
    else
      if begin_time.present? && end_time.nil?
        @charge_session = ChargeSession.new(action_id: 2, time: Time.now, booking: @booking)
        if @charge_session.save
          begin_time, end_time = set_times
          seconds = end_time - begin_time
          hours = 0.0
          hours = (seconds / 3600).to_f
          v_kwh = @booking.vehicle.charger_kwh
          c_kwh = @booking.charge_station.charge_kwh
          kwh = c_kwh < v_kwh ? c_kwh : v_kwh
          payment = (@booking.charge_station.price_kwh_cents * hours * kwh).to_i
          unless @booking.update_attributes!(price_cents: payment)
            flash[:error] = 'Unable to update Booking record with completed price.'
          end
          redirect_to charge_session_path(id: @booking.id),notice: 'Charge session was successfully completed.'
        end
      end
    end
  end
  
  private
  
    def set_booking
      @booking = Booking.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(:id, :booking_id, :price_cents)
    end
  
    def set_times
      @sessions = ChargeSession.where(booking: @booking).order(:time)
      # cater for crashes - incomplete records
      start_time = end_time = nil
      @sessions.each do |session|
        start_time = session.time if !start_time && session.time.present? && session.action_id == 1
        end_time = session.time if session.time.present? && session.action_id == 2
      end
      [start_time, end_time]
    end
  
end
