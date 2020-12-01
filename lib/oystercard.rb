class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    fail "£#{MAX_BALANCE} Max. Value Exceeded" if amount + balance > MAX_BALANCE  
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
  
end
