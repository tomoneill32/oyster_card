class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE_TO_TRAVEL = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_VALUE
    @in_use = false
  end

  def top_up(funds)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(funds)
    @balance += funds
  end

  def check_balance
    balance
  end

  def in_journey?
    in_use
  end

  def touch_in
    fail "Insufficient funds - balance below #{MINIMUM_BALANCE_TO_TRAVEL}" if insufficient_balance?
    self.in_use=(true)
  end

  def touch_out
    self.in_use=(false)
    deduct(MINIMUM_FARE)
  end

  private

  attr_reader :balance
  attr_accessor :in_use

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