require 'oystercard'
require 'station'
require 'journey'

card = Oystercard.new(50)
station1 = Station.new("Aldgate", 1)
station2 = Station.new("Green Park", 1)
journey = Journey.new

puts
puts "*" * 50
puts "Starting feature test"
puts "*" * 50
puts


card.touch_in(station1)
puts "Here are the journeys #{card.journeys}"
puts card.current_journey.complete
card.touch_in(station2)
puts card.journeys

puts
puts "*" * 50
puts "Ending feature test"
puts "*" * 50
puts
