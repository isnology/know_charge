class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile
  
  def index
    set_map
    
    # get location based on ip address (doesn't work)
    # @ip = 59.100.247.2
    #response = HTTParty.get("http://api.ipinfodb.com/v3/ip-city/?key=#{ENV.fetch('IPINFO_KEY')}&ip=#{@ip}")

    #result = Geocoder.search(@ip)
    #if result[0].data['latitude'].present?
    #  @center_map_latitude = result[0].data['latitude']
    #  @center_map_longitude = result[0].data['longitude']
    #else
    #  current_user_address  = current_user.profile.address
    #  @center_map_latitude  = current_user_address.latitude
    #  @center_map_longitude = current_user_address.longitude
    #end
  end

  def show
    set_map
    @charge_station = ChargeStation.find(home_params[:id])
    @adapter_plugs = AdapterPlug.where(charge_station: @charge_station)
    @plugs = []
    @adapter_plugs.each { |plug| @plugs << Adapter.find(plug.adapter_id) }
    start_month = (Date.today << 1).beginning_of_month
    end_month = (Date.today >> 1).end_of_month
    @bookings = Booking.where(charge_station: @charge_station).where(start_time: (start_month..end_month))
    
    @vehicles = Vehicle.where(user: @current_user)
    
    # dynamic navigation on return button (save where we come from)
    session[:conversations_rtn] = "#{home_path(id: @charge_station.id)}#station"
    session[:messages_rtn] = session[:conversations_rtn]
  end
  
  private
  
    def check_profile
      unless current_user.profile
        redirect_to new_profile_path
      end
    end

    def home_params
      params.permit(:id, :search)
    end
  
    def set_map
      # center the map based on a "search/position" address if one entered
      if @search = home_params[:search]
        geocode_result = Geocoder.search(@search)
        if geocode_result.present? &&
            geocode_result[0].data['geometry']['location'].present?
          @center_map_latitude  = result[0].data['geometry']['location']['lat']
          @center_map_longitude = result[0].data['geometry']['location']['lng']
        end
      else
        current_user_address  = current_user.profile.address
        @center_map_latitude  = current_user_address.latitude
        @center_map_longitude = current_user_address.longitude
      end
  
      @locations = []
      @stations = ChargeStation.all
  
      # build a 2 dimensional array for use with the javascript code ,embedded in the page, to locate the pins for
      # each charge station
      @stations.each do |station|
        url = "#{home_path(id: station.id)}#station"
        station_address = station.address
        @locations << [station_address.latitude, station_address.longitude, url]
      end
    end
end
