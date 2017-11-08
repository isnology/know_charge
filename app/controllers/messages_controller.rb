class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversation = Conversation.find(params.permit(:conversation_id)[:conversation_id])
    @messages = Message.for_display(@conversation)
    @message = Message.new(content: '', conversation_id: @conversation.id, user_id: current_user.id)
    @mark = Message.un_read(@conversation, current_user)
    @mark.each do |rec|
      rec.read = true
      rec.save
    end
    # params for justify_msg helper
    @my_id = 'm-right'
    @other_id = 'm-left'
    # passed as a data attribute on the body tag
    @code = Message.find_my_id(current_user, @conversation)
  end

  def create
    @conversation = Conversation.find(message_params[:conversation_id])
    message = Message.new(message_params)
    message.user_id = current_user.id
    # make the conversation user_id code = 'a', charge station user_id code = 'b'
    # params for justify_msg helper (different on send - replaced in javascript prior to display)
    @my_id = Message.find_my_id(current_user, @conversation)
    @other_id = ''  # messages I send will always be my_id but need as a place holder for helper
    if message.save
      ActionCable.server.broadcast "room_channel_#{@conversation.id}",
                                   message: render_message(message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
