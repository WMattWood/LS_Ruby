module Walkable

  def walk 
    puts "Hey #{name}, let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "I am a cat named #{name}."
  end
end

kitty = Cat.new('Murphy')
kitty.greet
kitty.name = "Sophie"
kitty.greet
kitty.walk