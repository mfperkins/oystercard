require_relative 'journey'

class Oystercard

  attr_reader :balance, :max_balance, :journeys, :current_journey

  DEFAULT_MAX = 90

  def initialize(balance = 0, max_balance = DEFAULT_MAX)
    @balance = balance
    @max_balance = max_balance
    @journeys = []
    @current_journey = nil
  end

  def top_up(amount)
    fail "balance cannot exceed £#{@max_balance}" if amount > max_balance - balance
    @balance += amount
  end

  def touch_in(station)
    fail "balance less than £#{Journey::MIN_FARE} - please top up" if balance < Journey::MIN_FARE
    if current_journey != nil
      @journeys << current_journey.journey
      deduct(current_journey.fare)
      @current_journey = nil
    end
    journey_check
    current_journey.start(station)
  end

  def touch_out(station)
    journey_check
    current_journey.finish(station)
    deduct(current_journey.fare)
    @journeys << current_journey.journey
    @current_journey = nil
  end

  private

  def journey_check
    @current_journey = Journey.new if current_journey == nil
  end

  def deduct(amount)
    @balance -= amount
  end

end
