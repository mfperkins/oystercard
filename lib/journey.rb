class Journey

  attr_reader :entry_station

  def initialize(station:)
    @entry_station = station

  end

  def finish(station)
    @exit_station = station
  end





end
