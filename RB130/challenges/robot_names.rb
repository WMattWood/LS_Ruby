class Robot
  attr_accessor :name
  @@robot_names = []

  def initialize
    @name = namer_method
  end

  def namer_method
    name = name_generator
    name = name_generator if @@robot_names.include?(name)
    @@robot_names << name
    name
  end

  def name_generator
    output = ""
    2.times { output << ('A'..'Z').to_a.sample }
    3.times { output << (0..9).to_a.sample.to_s }
    output
  end

  def reset
    initialize
  end
end