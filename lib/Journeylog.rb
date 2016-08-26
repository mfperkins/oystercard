require_relative "journey"

class Journeylog

  attr_reader :journey, :journeys, :last_fare

  def initialize
    @journey = nil
    @journeys = []
    @last_fare = 0
  end

  def start(station)
    @journey = Journey.new(station)
  end

  def finish(station)
    journey.finish_journey(station)
    @journeys << {:entry_station => journey.entry_station , :exit_station => journey.exit_station}
    @last_fare = @journey.fare
    @journey = nil
  end

#test logic for passing back correct fare

end
