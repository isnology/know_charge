class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:new, :create]
  
  def show
    @booking = Booking.find(params[:id])
    @charge_session_name = "#{@booking.charge_station.address.small_address} - #{@booking.vehicle.licence_plate}"
    @payment = Payment.where(booking: @booking)
    total = @payment.inject(0) { |total, payment|  total + payment.price_cents }
    if total >= @booking.price_cents
      redirect_to charge_sessions_path(id: @booking.id), notice: 'Payment complete'
    end
    # Amount in cents
    @amount = @booking.price_cents - total
  end
  
  def new
    @payment = Payment.where(booking: @booking)
    @amount = params[:amount].to_i
    @name = params[:name]
    if @amount == 0
      redirect_to charge_sessions_path(id: @booking.id)
    end
  end

  def create
    @payment = Payment.new
    @payment.booking_id = params[:booking_id]
    #amount in cents
    @amount = params[:amount].to_i
    @payment.price_cents = @amount
  
    customer = Stripe::Customer.create(
        :email => current_user.email,
        :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => params[:name],
        :currency    => 'aud'
    )
  
    @payment.charge_identifier = charge
    @payment.save
    redirect_to payment_path(id: @payment.booking_id)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payment_path(id: @payment.booking_id)
  end

  private

    def set_booking
      @booking = Booking.find(params[:booking_id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(:id, :booking_id, :price_cents)
    end
  
end
