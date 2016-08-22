class Oystercard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1
  attr_reader :balance, :journeys

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    fail "You can't top-up over #{MAX_LIMIT}" if @balance + amount >= MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Your balance is below #{MIN_FARE}" if @balance < MIN_FARE
    @journeys << {:entry_station => station, :exit_station => nil }
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journeys[-1][:exit_station] = station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    entry_station != nil
  end
end
