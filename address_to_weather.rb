require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

url_location = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_address

raw_data = open(url_location).read
parsed_data = JSON.parse(raw_data)

results = parsed_data["results"]
first = results[0]
geometry = first["geometry"]
location = geometry["location"]


the_latitude = location["lat"]
the_longitude = location["lng"]

url_weather = "https://api.forecast.io/forecast/f33d281c4d30d6dcd6850cd3bf94f2d2/" + the_latitude.to_s + "," + the_longitude.to_s

raw_data = open(url_weather).read
parsed_data = JSON.parse(raw_data)
currently = parsed_data["currently"]

# Current temperature
the_temperature = currently["temperature"]

# Hour outlook
hourly = parsed_data["hourly"]
the_hour_outlook = hourly["summary"]

# Next day outlook
daily = parsed_data["daily"]
the_day_outlook = daily["summary"]


puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
