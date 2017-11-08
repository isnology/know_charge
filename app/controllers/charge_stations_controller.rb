class ChargeStationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charge_station, only: [:show, :edit, :update, :destroy]

  # GET /charge_stations
  # GET /charge_stations.json
  def index
    @charge_stations = ChargeStation.where(user: current_user)
  end

  # GET /charge_stations/1
  # GET /charge_stations/1.json
  def show
    @adapter_plugs = AdapterPlug.where(charge_station: @charge_station)
    @plugs = []
    @adapter_plugs.each { |plug| @plugs << Adapter.find(plug.adapter_id) }
    session[:conversations_rtn] = charge_station_path(@charge_station)
    session[:messages_rtn] = session[:conversations_rtn]
  end

  # GET /charge_stations/new
  def new
    @charge_station = ChargeStation.new
  end

  # GET /charge_stations/1/edit
  def edit
  end

  # POST /charge_stations
  # POST /charge_stations.json
  def create
    @charge_station = ChargeStation.new(charge_station_params)
    @charge_station.user = current_user

    respond_to do |format|
      if @charge_station.save
        format.html { redirect_to @charge_station, notice: 'Charge station was successfully created.' }
        format.json { render :show, status: :created, location: @charge_station }
      else
        format.html { render :new }
        format.json { render json: @charge_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charge_stations/1
  # PATCH/PUT /charge_stations/1.json
  def update
    respond_to do |format|
      if @charge_station.update(charge_station_params)
        format.html { redirect_to @charge_station, notice: 'Charge station was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge_station }
      else
        format.html { render :edit }
        format.json { render json: @charge_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charge_stations/1
  # DELETE /charge_stations/1.json
  def destroy
    @charge_station.destroy
    respond_to do |format|
      format.html { redirect_to charge_stations_url, notice: 'Charge station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge_station
      @charge_station = ChargeStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_station_params
      params.require(:charge_station).permit(:street_number, :street, :city, :postcode, :state, :charge_kwh, :adapter_id, :open_time, :close_time, :days_of_week, :price_kwh_cents, :user_id)
    end
end
