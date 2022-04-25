class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90

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

  private

  attr_reader :balance

  def exceeds_max?(funds)
    balance + funds > MAXIMUM_BALANCE
  end
end