require_relative "journey"

class Journeylog

  attr_reader :journey, :journeys, :last_fare, :outstanding_fare

  def initialize
    @journey = nil
    @journeys = []
    @last_fare = 0
    @outstanding_fare = 0
  end

  def start(station)
    check_start
    @journey = Journey.new(station)
  end

  def finish(station)
    check_finish
    journey.finish_journey(station)
    journeys << journey.journey
    @last_fare = journey.fare
    @journey = nil
    @outstanding_fare = 0
  end

  private

  def check_start
    if journey != nil
      @outstanding_fare = journey.fare
      journey.finish_journey
      journeys << journey.journey
    end
  end

  def check_finish
    if journey == nil
      @journey = Journey.new
    end
  end

end
