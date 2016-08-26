require_relative 'journey'
require_relative 'journeylog'

class Oystercard

  attr_reader :balance, :journeylog

  BALANCE_LIMIT = 90

  def initialize(journeylog = JourneyLog.new)
    @balance = 0
    @journeylog = journeylog
  end

  def touch_in(station)
    fail 'you have insufficient funds on your oystercard' if balance < Journey::MIN_FARE
    if journeylog.thisjourney != nil
      deduct(journeylog.thisjourney.fare)
    end
    journeylog.start(station)
  end

  def touch_out(station)
    deduct(journeylog.finish(station))
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
