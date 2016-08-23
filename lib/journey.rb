class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :journey

  def initialize
    @journey = {}
  end

  def start(station)
    @journey[:entry_station] = station
  end

  def finish(station)
    @journey[:exit_station] = station
  end

  def is_complete?
    journey.length == 2
  end

  def fare
    is_complete? ? MIN_FARE : PENALTY_FARE
  end

end
