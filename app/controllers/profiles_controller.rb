class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :new, :edit, :update, :destroy]

  
  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if @profile.nil?
      redirect_to new_profile_path
    end
    @address = @profile.address
  end

  # GET /profiles/new
  def new
    if @profile.present?
      redirect_to profile_path
    end
    @profile = Profile.new
    @profile.build_address
  end

  # GET /profiles/1/edit
  def edit
    @profile.build_address if @profile.address.nil?
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    update_params = profile_params
    update_params[:user_id] = current_user.id
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :street_number, :street, :city, :postcode, :state,
                              :image, address_attributes: [:id, :number, :street, :city, :state, :postcode, :country])
    end
  
end
