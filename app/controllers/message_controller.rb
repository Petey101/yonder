class MessageController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def receive_sms
    boot_twilio
    words_arr = params["Body"].split(" ")
    if words_arr[0].downcase == "water"
     # "water 90.56 39.23"
      words = Message.generate_water_message(words_arr[1], words_arr[2])
    elsif words_arr[0].downcase == "weather"
      words = Message.generate_weather_message(words_arr[1], words_arr[2])
    else
      words = "Please enter 'water' or 'weather' followed by your latitude and longitude. i.e. 'water -2.51 32.69' Standard SMS rates apply"
    end

    sms = @client.messages.create(
      from: +16788418305,
      to: params["From"],
      body: words)

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
