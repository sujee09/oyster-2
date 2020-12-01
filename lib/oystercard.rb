class Oystercard
  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  FARE = 2

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "£#{MAX_BALANCE} Max. Value Exceeded" if amount + balance > MAX_BALANCE

    @balance += amount
  end

  def in_journey?
    @entry_station.nil? ? false : true
  end

  def touch_in(station)
    raise "Balance is too low - it's less than £#{MIN_BALANCE} min. fare" if @balance < MIN_BALANCE

    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct
    @balance -= FARE
  end

end
