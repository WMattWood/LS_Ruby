class Robot
  attr_accessor :name

  def initialize
    @name = namer_method
  end

  def namer_method
    name = ""
    2.times { name << pick_letter }
    3.times { name << pick_number }
    puts name
    # name
  end

  def pick_letter
    ('A'..'Z').to_a.sample
  end

  def pick_number
    (0..9).to_a.sample.to_s
  end
end

the_robot = Robot.new
puts the_robot.name