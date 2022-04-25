class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE_TO_TRAVEL = 1

  def initialize
    @balance = DEFAULT_VALUE
    @in_use = false
  end

  def top_up(funds)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(funds)
    @balance += funds
  end

  def deduct(fare)
    @balance -= fare
  end

  def check_balance
    balance
  end

  def in_journey?
    in_use
  end

  def touch_in
    fail "Insufficient funds - balance below #{MINIMUM_BALANCE_TO_TRAVEL}" if insufficient_balance?
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  private

  attr_reader :balance, :in_use

  def exceeds_max?(funds)
    balance + funds > MAXIMUM_BALANCE
  end

  def insufficient_balance?
    check_balance < MINIMUM_BALANCE_TO_TRAVEL
  end

end