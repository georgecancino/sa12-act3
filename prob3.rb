require 'httparty'
require 'json'

API_KEY = 'NXZYuA9LbXrIlRzZZHNxokuFL7uMuNrb'
BASE_URL = 'https://app.ticketmaster.com/discovery/v2/events.json'

def find_events(location)
  response = HTTParty.get("#{BASE_URL}?apikey=#{API_KEY}&city=#{location}")
  if response.code == 200
    data = JSON.parse(response.body)
    events = data['_embedded']['events']
    if events.nil? || events.empty?
      puts "No events found for the specified location."
    else
      events.each do |event|
        name = event['name']
        start_time = event['dates']['start']['localDate']
        venue_name = event['_embedded']['venues'][0]['name']
        puts "Event: #{name}"
        puts "Start Date: #{start_time}"
        puts "Venue: #{venue_name}"
        puts "-" * 30
      end
    end
  else
    puts "Error: Failed to fetch events. HTTP Status Code: #{response.code}"
  end
end

# Example for Memphis events
find_events('Memphis')
