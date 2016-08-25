require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :currentjourney

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
    @journeys = {}
    @currentjourney = nil
  end

  def touch_in(station)
    fail 'you have insufficient funds on your oystercard' if balance < Journey::MIN_FARE
    if currentjourney != nil
      deduct(currentjourney.fare)
      @journey[:entry] = station
    end
    @currentjourney = Journey.new
    @journeys[:entry] = station
    currentjourney.start(station)
  end


  def touch_out(station)
    if currentjourney == nil
      @currentjourney = Journey.new
    end
    currentjourney.finish(station)
    deduct(currentjourney.fare)
    @journeys[:exit] = station
    @currentjourney = nil
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
