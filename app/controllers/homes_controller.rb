class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile
  
  def index
    # center the map based on a "search/position" address if one entered
    if @search = params[:search]
      geocode_result = Geocoder.search(@search)
      if geocode_result.present?
        if geocode_result[0].data['geometry']['location'].present?
          @center_map_latitude  = result[0].data['geometry']['location']['lat']
          @center_map_longitude = result[0].data['geometry']['location']['lng']
        end
      end
    else
      current_user_address  = current_user.profile.address
      @center_map_latitude  = current_user_address.latitude
      @center_map_longitude = current_user_address.longitude
    end
    
    @locations = []
    @stations = ChargeStation.all
    
    # build a 2 dimensional array for use with the javascript code ,embedded in the page, to locate the pins for each
    # charge station
    @stations.each do |station|
      url = "#{root_url}?charge_station=#{station.id}#station"
      station_address = station.address
      @locations << [station_address.latitude, station_address.longitude, url]
    end
    
    # @ip = 59.100.247.2
    #response = HTTParty.get("http://api.ipinfodb.com/v3/ip-city/?key=#{ENV.fetch('IPINFO_KEY')}&ip=#{@ip}")

    #result = Geocoder.search(@ip)
    #if result[0].data['latitude'].present?
    #  @lat_center = result[0].data['latitude']
    #  @long_center = result[0].data['longitude']
    #else
    #  @me = current_user.profile
    #  @lat_center = @me.latitude
    #  @long_center = @me.longitude
    #end

    if params[:charge_station].present?
      @charge_station = ChargeStation.find(params[:charge_station])
      @adapter_plugs = AdapterPlug.where(charge_station: @charge_station)
      @plugs = []
      @adapter_plugs.each { |plug| @plugs << Adapter.find(plug.adapter_id) }
      start_month = (Date.today << 1).beginning_of_month
      end_month = (Date.today >> 1).end_of_month
      @bookings = Booking.where(charge_station: @charge_station).where(start_time: (start_month..end_month))
      
      @vehicles = Vehicle.where(user: @current_user)
      
      # dynamic navigation on return button (save where we come from)
      session[:conversations_rtn] = "#{root_url}?charge_station=#{@charge_station.id}#station"
      session[:messages_rtn] = session[:conversations_rtn]
    end
  end
  
  private
  
    def check_profile
      unless current_user.profile
        redirect_to new_profile_path
      end
    end

    def home_params
      params.permit(:charge_station, :search)
    end
end
