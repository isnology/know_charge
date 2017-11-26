module MessagesHelper
  # Returns HTML from input text using GitHub-flavored Markdown.
  def markdown_to_html(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end

  def justify_msg(current_user_code, other_user_code, message)
    message.user_id == current_user.id ? current_user_code : other_user_code
  end
  
  def other_user_name(user_code)
    vehicle_owner = 'a'
    user_code == vehicle_owner ? @conversation.charge_station.address.small_address : @conversation.user.profile
                                                                                         .full_name
  end
end
