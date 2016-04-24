class Message < ActiveRecord::Base


  def self.get_water_locations(lat, lon)
    url = "https://data.waterpointdata.org/resource/gihr-buz6.json?$where=within_circle(location, #{lat}, #{lon}, 5000)"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    #not actually the closest source...
    return JSON.parse(response)[0]
  end

  def self.calc_distance_between(lat1, lon1, lat_user, lon_user)
     radius = 3958.7558657440545
     d_lat = to_rad(lat_user-lat1)
     d_lon = to_rad(lon_user-lon1)
     a = Math.sin(d_lat/2) * Math.sin(d_lat/2) +
             Math.cos(to_rad(lat1)) * Math.cos(to_rad(lat_user)) *
             Math.sin(d_lon/2) * Math.sin(d_lon/2)
     c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
     d = radius * c
  end

  def self.get_direction(lat1, lon1, lat_user, lon_user)
    radians = get_atan2((lon1 - lon_user), (lat1 - lat_user))

    compass_reading = radians * (180 / Math::PI)

    coord_names = ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"]
    coord_index = (compass_reading / 45).round
    coord_index = coord_index + 8 if coord_index < 0
    coord_names[coord_index]
  end

  def self.generate_water_message(user_lat, user_lon)
    location_lat = self.get_water_locations(user_lat, user_lon)["lat_deg"]
    location_lon = self.get_water_locations(user_lat, user_lon)["lon_deg"]
    distance = calc_distance_between(location_lat.to_f, location_lon.to_f, user_lat.to_f, user_lon.to_f)
    direction = get_direction(location_lat.to_f, location_lon.to_f, user_lat.to_f, user_lon.to_f)

    message = "The closest water source is #{distance.round(2)} miles away in the #{direction} direction."
  end

  def self.get_atan2(y, x)
   Math.atan2(y, x)
  end

  def self.to_rad(value)
   return value * Math::PI / 180
  end


  # def self.closest_source(lat, lon)
  #   locations = self.get_water_locations(lat,lon)
  #   sorted_locations = []
  #   locations.each do |location|
  #     puts location
  #     sorted_locations.push({source: location, distance: calc_distance_between(location["lat_deg"].to_f,location["lon_deg"].to_f, lat.to_f, lon.to_f)})
  #   end
  #   sorted_locations.sort_by { |location| location.distance}
  #   return sorted_locations
  # end

  def get_weather_string
  end

  def get_info
  end

end