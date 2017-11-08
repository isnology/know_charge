class FavouritesController < ApplicationController

  # GET /favourites
  def index
    vehicles = Vehicle.where(user: current_user)
    bookings = Booking.where(vehicle_id: vehicles)
    @favourites = Favourite.where(booking_id: bookings)
    @bookings = bookings.order({start_time: :desc}, :charge_station_id, :name).limit(10)
  end
  
  # POST /favourites
  def create
    @favourite = Favourite.new(favourite_params)
    
    if @favourite.save
      redirect_to favourites_path, notice: 'Favourite was successfully created.'
    else
      render :new
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_url, notice: 'Favourite was successfully destroyed.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_params
      params.permit(:booking_id)
    end
end
