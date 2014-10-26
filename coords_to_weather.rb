require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

url = "https://api.forecast.io/forecast/f33d281c4d30d6dcd6850cd3bf94f2d2/" + the_latitude + "," + the_longitude

raw_data = open(url).read
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

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
