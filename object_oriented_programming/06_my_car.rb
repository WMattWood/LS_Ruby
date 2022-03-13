class MyCar

  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y 
    @color = c 
    @model = m 
    @speed = 0
  end

  def self.mileage(gallons, miles)
    puts "This #{ @model } gets #{ miles / gallons } mpg."
  end

  def speed_up(number)
    @speed += number
  end

  def brake(number)
    @speed -= number
  end

  def shut_off(number)
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "You spray a nice new coat of #{self.color} paint on this bad boy."
  end

  def to_s
    "This is a nice #{@color}, #{@year} #{@model}."
  end

end

clown_car = MyCar.new(1197, 'grey', 'clown car')
puts clown_car
