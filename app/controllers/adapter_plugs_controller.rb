class AdapterPlugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charge_station
  before_action :set_adapter_plug, only: [:edit, :update, :destroy]

  # GET /adapter_plugs
  # GET /adapter_plugs.json
  def index
    @adapter_plugs = AdapterPlug.where(charge_station: @charge_station)
  end
  
  # GET /adapter_plugs/new
  def new
    @adapter_plug = AdapterPlug.new
  end

  # GET /adapter_plugs/1/edit
  def edit
  end

  # POST /adapter_plugs
  # POST /adapter_plugs.json
  def create
    @adapter_plug = AdapterPlug.new(adapter_plug_params)
    @adapter_plug.charge_station = @charge_station

    respond_to do |format|
      if @adapter_plug.save
        format.html { redirect_to charge_station_adapter_plugs_path(@charge_station),
                                  notice: 'Adapter plug was successfully created.' }
        format.json { render :show, status: :created, location: @adapter_plug }
      else
        format.html { render :new }
        format.json { render json: @adapter_plug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adapter_plugs/1
  # PATCH/PUT /adapter_plugs/1.json
  def update
    respond_to do |format|
      if @adapter_plug.update(adapter_plug_params)
        format.html { redirect_to charge_station_adapter_plugs_path(@charge_station),
                                  notice: 'Adapter plug was successfully updated.' }
        format.json { render :show, status: :ok, location: @adapter_plug }
      else
        format.html { render :edit }
        format.json { render json: @adapter_plug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adapter_plugs/1
  # DELETE /adapter_plugs/1.json
  def destroy
    @adapter_plug.destroy
    respond_to do |format|
      format.html { redirect_to charge_station_adapter_plugs_url, notice: 'Adapter plug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adapter_plug
      @adapter_plug = AdapterPlug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adapter_plug_params
      params.require(:adapter_plug).permit(:adapter_id, :charge_station_id)
    end
  
    def set_charge_station
      @charge_station = ChargeStation.find(params[:charge_station_id])
    end
end
