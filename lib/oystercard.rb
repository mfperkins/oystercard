class Oystercard

  attr_reader :balance, :entry_station


  BALANCE_LIMIT = 90
  MIN_FARE = 1



  def initialize
    @balance = 0
    @in_journey = false
  end



  def touch_in(station)
    fail 'you have insufficient funds on your oystercard' if balance < MIN_FARE
    @entry_station = station
  end

  def in_journey?
    !!entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def top_up(value)
    fail "Your top up will exceed balance limit of #{BALANCE_LIMIT}!" if value + balance > BALANCE_LIMIT
    @balance += value
  end

private

  def deduct(fare)
    @balance -= fare
  end



end
