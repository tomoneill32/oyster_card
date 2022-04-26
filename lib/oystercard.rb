class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE_TO_TRAVEL = 1
  MINIMUM_FARE = 1

  attr_reader :journey_history

  def initialize
    @balance = DEFAULT_VALUE
    @journey_history = []
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
    add_entry_station(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    add_exit_station(station)
    add_journey
    add_entry_station(nil)
  end

  private

  attr_reader :balance, :entry_station, :exit_station

  def exceeds_max?(funds)
    balance + funds > MAXIMUM_BALANCE
  end

  def insufficient_balance?
    check_balance < MINIMUM_BALANCE_TO_TRAVEL
  end

  def deduct(fare)
    @balance -= fare
  end

  def add_journey
    @journey_history << {entry_station: @entry_station, exit_station: @exit_station}
  end

  def add_exit_station(station)
    @exit_station = station
  end

  def add_entry_station(station)
    @entry_station = station
  end

end