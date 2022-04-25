class Oystercard
  DEFAULT_VALUE = 0

  def initialize
    @balance = DEFAULT_VALUE
  end

  def check_balance
    balance
  end

  private

  attr_reader :balance
end