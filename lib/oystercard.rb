require_relative 'journey'
require_relative 'Journeylog'

#Maintains a balance through touch in & touch out. Also records journey history, soon to be pulled out.

class Oystercard

MAXIMUM_LIMIT = 90
MINIMUM_LIMIT = 1

attr_reader :balance

  def initialize(journeylog = Journeylog.new)
    @balance = 0
    @journeylog = journeylog
  end

  def top_up(amount)
    fail 'Top up limited exceeded' if amount + balance > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds. Please top up." if balance < MINIMUM_LIMIT
    @journeylog.start(entry_station)
  end

  def touch_out(exit_station)
    @journeylog.finish(exit_station)
    deduct(@journeylog.last_fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
