class MessageController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def receive_sms
    boot_twilio
    sms = @client.messages.create(
      from: +16788418305,
      to: params["From"],
      body: "HI!")

  end

  def get_water_string
  end

  def get_weather_string
  end

  def get_info
  end

  private
   def boot_twilio
    account_sid = "AC17942be75d5e9d315c1b7fc261258605"
    auth_token = "7572027dbfcb8d906abe23eb442364e1"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

end






    # content_type 'text/xml'

    # response = Twilio::TwiML::Response.new do |r|
    #   r.Message "This is working"
    # end

    # response.to_xml
