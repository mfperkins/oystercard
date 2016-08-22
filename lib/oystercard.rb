class Oystercard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1
  attr_reader :balance, :entry_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station
  end

  def top_up(amount)
    fail "You can't top-up over #{MAX_LIMIT}" if @balance + amount >= MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Your balance is below #{MIN_FARE}" if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    entry_station != nil
  end
end
