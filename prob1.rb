require 'httparty'
require 'json'

API_KEY = '961f4a527b0f448ead963048242803'
CITY = 'Memphis'

response = HTTParty.get("https://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{CITY}")
data = JSON.parse(response.body)

temperature_c = data['current']['temp_c']
humidity = data['current']['humidity']
condition = data['current']['condition']['text']

puts "Current temperature in #{CITY}: #{temperature_c}°C"
puts "Humidity: #{humidity}%"
puts "Weather condition: #{condition}"
