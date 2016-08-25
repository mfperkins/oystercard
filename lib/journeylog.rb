require_relative 'journey'

class JourneyLog

  attr_reader  :journeys, :thisjourney

  def initialize
    @thisjourney = nil
    @journeys = []
  end

def start(station)
  current_journey.start(station)
  @journeys << {entry_station: station, exit_station: nil}
end

def finish(station)
  current_journey.finish(station)
  journeys[-1][:exit_station] = station
  @thisjourney = nil
end

private
def current_journey(new_journey = Journey.new)
  if thisjourney == nil
    @thisjourney = new_journey
  else
    thisjourney
  end
end
end
