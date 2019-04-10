class Oystercard
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
FARE = 2
  attr_reader :balance, :in_journey, :entry_station

 def initialize
   @balance = 0
   @in_journey = false
   @entry_station = nil
 end

def top_up(value)
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
  @balance += value
end

def in_journey?
  @in_journey
end

def touch_in(station)
  raise "you have less then #{MINIMUM_BALANCE}, please top up" if @balance < MINIMUM_BALANCE
  @in_journey = true
  @entry_station = station
end

def touch_out
  deduct(FARE)
  @in_journey = false
end

private
def deduct(value)
  @balance -= value
end

end
