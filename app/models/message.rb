class Message < ActiveRecord::Base


  def self.get_water_locations(lat, lon)
    url = "https://data.waterpointdata.org/resource/gihr-buz6.json?$where=within_circle(location, #{lat}, #{lon}, 5000)"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    #not actually the closest source...
    return JSON.parse(response)[0]

  end

  def calc_distance_between(lat1, lon1, lat2, lon2)
     radius = 3958.7558657440545
     d_lat = to_rad(lat2-lat1)
     d_lon = to_rad(lon2-lon1)
     a = Math.sin(d_lat/2) * Math.sin(d_lat/2) +
             Math.cos(to_rad(lat1)) * Math.cos(to_rad(lat2)) *
             Math.sin(d_lon/2) * Math.sin(d_lon/2)
     c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
     d = radius * c
  end

  def to_rad(value)
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