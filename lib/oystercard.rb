class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE_TO_TRAVEL = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_VALUE
  end

  def top_up(funds)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(funds)
    @balance += funds
  end

  def check_balance
    balance
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Insufficient funds - balance below #{MINIMUM_BALANCE_TO_TRAVEL}" if insufficient_balance?
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  attr_reader :entry_station

  private

  attr_reader :balance

  def exceeds_max?(funds)
    balance + funds > MAXIMUM_BALANCE
  end

  def insufficient_balance?
    check_balance < MINIMUM_BALANCE_TO_TRAVEL
  end

  def deduct(fare)
    @balance -= fare
  end

end