require_relative 'journey'

class JourneyLog

  attr_reader  :journeys, :thisjourney

  def initialize
    @thisjourney = nil
    @journeys = []
  end

  def start(station)
    if current_journey != nil
      @thisjourney = nil
    end
    current_journey.start(station)
    @journeys << {entry_station: station, exit_station: nil}
  end

  def finish(station)
    current_journey.finish(station)
    journeys[-1][:exit_station] = station
    journey_fare = current_journey.fare
    @thisjourney = nil
    journey_fare
  end

  private

  def current_journey
    thisjourney || @thisjourney = Journey.new
  end

end
