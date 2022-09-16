class Clock
  MINUTES_IN_A_DAY = 24 * 60
  attr_accessor :hour, :minute

  def initialize(hour, minute=0)
    @hour = hour % 24
    @minute = minute % 60
  end

  def <=>(other)
    self.to_s <=> other.to_s
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def to_s
    "#{'%02d' % @hour}:#{'%02d' % @minute}"
  end

  def self.at(hour, minute=0)
    self.new(hour, minute)
  end

  def +(num)
    # derive values
    num = num % MINUTES_IN_A_DAY
    hours, minutes = num.divmod(60)
    
    # perform updates
    @hour += hours
    @minute += minutes
  
    # format values
    @hour = @hour % 24
    @minute = @minute % 60
    self
  end

  def wrap_at_value(x, y, value)
    x > y ? (x - y) : value - (y - x) 
  end

  def -(num)
    # derive values
    num = num % MINUTES_IN_A_DAY
    hours, minutes = num.divmod(60)

    # perform updates
    hours += 1 if minutes > @minute
    @hour = wrap_at_value(@hour, hours, 24)
    @minute = wrap_at_value(@minute, minutes, 60) 
   
    # format the @hour and @minute instance variables correctly
    @hour = @hour % 24
    @minute = @minute % 60
    self
  end

end

bof = Clock.new(25)
puts bof
baf = bof - 1440
puts baf