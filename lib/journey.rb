class Journey

  attr_reader :entry_station

  MIN_FARE = 1

  def initialize(station:)
    @entry_station = station

  end

  def finish(station)
    @exit_station = station
  end

  def fare
    MIN_FARE
  end



end
