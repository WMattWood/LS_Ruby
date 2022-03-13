class Vehicle 

  attr_accessor :color
  attr_reader :year
  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.mileage(miles_travelled, gallons)
    mpg = miles_travelled / gallons
    puts "This car gets #{mpg} mpg."
  end

  def speed_up(num)
    @speed += num
    puts "What did I tell you?  88 mph!!!" if @speed == 88
  end

  def brake(num)
    @speed >= num ? @speed -= num : @speed = 0
    puts "The vehicle is already stopped." if @speed == 0
  end

  def current_speed
    puts "You are now going #{@speed} mph."
  end

  def shut_off
    @speed = 0
    puts "Let's park this bad boy."
  end

  def spray_paint(color)
    @color = color
    puts "That's a nice coat of #{color} paint."
  end

  def self.how_many?
    puts "There are #{@@number_of_vehicles} vehicles."
  end

  def age
    find_age
  end

  private

  def find_age
    Time.now.year - year
  end
end


module Haulable
  def haul(load)
    puts "We've got #{load} in the flatbed!"
  end
end


class MyTruck < Vehicle

  NUMBER_OF_DOORS = 2
  include Haulable
  def to_s
    "This truck is a #{@color} #{@year} #{@model}, currently travelling at speeds of up to #{@speed} mph!"
  end
end


class MyCar < Vehicle

  NUMBER_OF_DOORS = 4
  def to_s
    "This car is a #{@color} #{@year} #{@model}, currently travelling at speeds of up to #{@speed} mph!"
  end
end



the_delorean = MyCar.new(1972, 'black', 'Delorean')
the_fordmobile = MyTruck.new(1980, 'silver', 'Escalade')

# puts the_delorean.class.ancestors
puts the_fordmobile.age
# puts the_fordmobile.ancestors

# puts the_delorean
# puts the_fordmobile
# Vehicle.how_many?
# the_fordmobile.haul("cheerios")

# puts the_delorean.year
# puts the_delorean.color
# the_delorean.speed_up(88)
# the_delorean.current_speed
# the_delorean.spray_paint('pink')
# puts the_delorean.color
# puts the_delorean
