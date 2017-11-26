class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :success]

  # GET /conversations
  # GET /conversations.json
  def index
    @charge_station = ChargeStation.find(params[:charge_station_id])
    if current_user == @charge_station.user
      @conversations = Conversation.where(charge_station_id: params[:charge_station_id])
    else
      @conversations = Conversation.where(user: current_user).where(charge_station_id: params[:charge_station_id])
    end
    @messages = {}
    @conversations.each do |conv|
      @messages.store(conv.id, Message.un_read(conv, current_user))
    end
    session[:messages_rtn] = conversations_path(charge_station_id: @charge_station.id)
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @charge_station = ChargeStation.find(params[:charge_station_id])
    if current_user == @charge_station.user
      # I am a lister so choose a conversation with user from list
      redirect_to(conversations_path(charge_station_id: @charge_station.id)) && return
    else
      # I am a customer looking to book
      @conv = Conversation.where(charge_station: @charge_station).where(user: current_user)
    end

    if @conv.first.present?
      # I have a conversation with host already
      redirect_to(messages_path(conversation_id: @conv.first.id)) && return
    end

    @conversation = Conversation.new(user: current_user, charge_station: @charge_station)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to messages_path(conversation_id: @conversation.id),
                                  notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:charge_station_id, :user_id)
    end
end
