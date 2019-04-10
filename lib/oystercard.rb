class Oystercard
MAXIMUM_BALANCE = 90
  attr_reader :balance
  attr_reader :in_journey

 def initialize
   @balance = 0
   @in_journey = false
 end

def top_up(value)
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
  @balance += value
end

def deduct(value)
  @balance -= value
end

def in_journey?
  @in_journey
end

def touch_in
  @in_journey = true
end

def touch_out
  @in_journey = false
end
end
