class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journey_list

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  FARE = 2

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
    @journey_list = []
    # hash = Hash.new
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
    # hash[:@entry_station] = station
  end

  def touch_out(station)
    deduct
    @in_journey = false
    @entry_station = nil
    @exit_station = station
    # hash[:@exit_staiton] = station
  end

  # def add_journey
    # instance_variables.each do |var|
    #   if var == @entry_station || @exit_station
    #     hash[var.to_s.delete('@')] = instance_variable_get(var)
    #   end
    # end
    # hash[:@entry_station] = @entry_station
    # hash[:@exit_staiton] = @exit_station
  #   @journey_list << hash
  #
  # end

  private

  def deduct
    @balance -= FARE
  end

end
