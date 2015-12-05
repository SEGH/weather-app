require 'yahoo_weatherman'

client = Weatherman::Client.new
response = client.lookup_by_location(19145)
puts response.methods