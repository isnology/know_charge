module MessagesHelper
  # Returns HTML from input text using GitHub-flavored Markdown.
  def markdown_to_html(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end

  def justify_msg(me, them, message)
    message.user_id == current_user.id ? me : them
  end
end
