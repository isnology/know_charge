class HomesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    if params[:charge_station].present?
      @charge_station = ChargeStation.find(params[:charge_station])
    end
    
    @locations = []
    @stations = ChargeStation.all
    @stations.each do |station|
      #url = "http://localhost:3000/?charge_station=#{station.id}" # path that returns json
      url = "#{root_url}?charge_station=#{station.id}"
      @locations << [station.city, station.latitude, station.longitude, url]
    end
    
    # @ip = ''
    #response = HTTParty.get("http://api.ipinfodb.com/v3/ip-city/?key=#{ENV.fetch('IPINFO_KEY')}&ip=#{@ip}")

    #result = Geocoder.search('59.100.247.2')
    #if result[0].data['latitude'].present?
    #  @lat_center = result[0].data['latitude']
    #  @long_center = result[0].data['longitude']
    #else
      @me = current_user.profile
      @lat_center = @me.latitude
      @long_center = @me.longitude
    #end
    
  end
end
