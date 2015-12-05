require 'yahoo_weatherman'

puts "Enter city or zip code for desired forecast"
zip = gets
client = Weatherman::Client.new
response = client.lookup_by_location(zip)
temperature = (response.condition['temp'] * 1.8) + 32

puts response.location['city']
puts "Currently #{response.condition['text']}, #{temperature.round} degrees farenheit"

today = Time.now.strftime('%w').to_i

response.forecasts.each do |forecast|
    high = (forecast['high'] * 1.8) + 32
    low = (forecast['low'] * 1.8) + 32
    day = forecast['date']
    weekday = day.strftime('%w').to_i
    
    if weekday == today
        dow = 'Today'
    elsif weekday == today + 1
        dow = 'Tomorrow'
    else
        dow = day.strftime('%A')
    end
    
    puts "#{dow} will be #{forecast['text']} with a high of #{high.round} and getting down to #{low.round}"
end