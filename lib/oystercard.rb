class Oystercard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1
  attr_reader :balance, :in_journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "You can't top-up over #{MAX_LIMIT}" if @balance + amount >= MAX_LIMIT
    @balance += amount
  end

  def touch_in
    fail "Your balance is below #{MIN_FARE}" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

end
