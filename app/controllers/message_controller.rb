class MessageController < ApplicationController

  def receive_sms
    content_type 'text/xml'

    response = Twilio::TwiML::Response.new do |r|
      r.message "This is working"
    end
  end
end
