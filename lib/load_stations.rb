class LoadStations

  DEFAULT_STATIONS = 'stations.csv'
  attr_reader :filename

  def initialize(filename = DEFAULT_STATIONS)

    @filename = filename

  end

end
