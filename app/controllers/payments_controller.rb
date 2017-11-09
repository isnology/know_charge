class PaymentsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
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
    redirect_to charge_session_path(id: @payment.booking_id)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end
end
