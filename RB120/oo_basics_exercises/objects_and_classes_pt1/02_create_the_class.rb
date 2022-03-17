module Walkable

  def walk 
    puts "Hey #{name}, let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name
  # attr_reader :name
  # attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "I am a cat named #{name}."
  end

  # GETTER METHOD
  # def name
  #   @name
  # end

  # SETTER METHOD
  # def name=(name)
  #   @name = name
  # end
end

kitty = Cat.new('Murphy')
kitty.greet
kitty.name = "Sophie"
kitty.greet
kitty.walk