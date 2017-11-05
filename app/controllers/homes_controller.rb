class HomesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @locations = []
    @stations = ChargeStation.all
    @stations.each do |station|
      url = "#{root_url}?charge_station=#{station.id}#station"
      @locations << [station.latitude, station.longitude, url]
    end
    
    # @ip = 59.100.247.2
    #response = HTTParty.get("http://api.ipinfodb.com/v3/ip-city/?key=#{ENV.fetch('IPINFO_KEY')}&ip=#{@ip}")

    #result = Geocoder.search(@ip)
    #if result[0].data['latitude'].present?
    #  @lat_center = result[0].data['latitude']
    #  @long_center = result[0].data['longitude']
    #else
      @me = current_user.profile
      @lat_center = @me.latitude
      @long_center = @me.longitude
    #end

    if params[:charge_station].present?
      @charge_station = ChargeStation.find(params[:charge_station])
      @adapter_plugs = AdapterPlug.where(charge_station: @charge_station)
      @plugs = []
      @adapter_plugs.each { |plug| @plugs << Adapter.find(plug.adapter_id) }
      start_month = Date.new(Date.today.year, Date.today.month - 1)
      end_month = Date.new(Date.today.year, Date.today.month + 1).end_of_month
      @meetings = Booking.where(charge_station: @charge_station).where(start_time: (start_month..end_month))
      
      @vehicles = Vehicle.where(user: @current_user)
      
      #meeting = Object.new
      #def meeting.start_time
      #  Time.now
      #end
      #def meeting.name
      #  "am"
      #end
      #@meetings << meeting
      
      #meeting2 = Object.new
      #def meeting2.start_time
      #  Time.parse('2017-11-15')
      #end
      #def meeting2.name
      #  "pm"
      #end
      #@meetings << meeting2
    end
    
  end
end
