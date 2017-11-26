require 'rest-client'

class SupportMailer < ApplicationMailer
  
  def contact_support(from_email, message)
    
    uri = "https://api:#{ENV.fetch('MAILGUN_API_KEY')}@api.mailgun.net/v2/#{ENV.fetch('MAILGUN_DOMAIN')}/messages"
    
    
    RestClient.post url,
      from: from_email,
      to: ENV.fetch('SUPPORT_EMAIL'),
      subject: 'Test',
      text: message,
      html: "<p>#{message}<p>"
    #mail(to: support_email, subject: "Support request from #{@from_email}")
  end
end