class Oystercard
  DEFAULT_VALUE = 0

  def initialize
    @balance = DEFAULT_VALUE
  end

  def top_up(funds)
    @balance += funds
  end

  def check_balance
    balance
  end

  private

  attr_reader :balance
end