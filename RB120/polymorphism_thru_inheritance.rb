# For example, assume we have a method that expects an argument that has 
# a move method. We can pass it any type of argument, provided it has a 
# compatible move method. The object might represent a human, a jellyfish,
# a cat, or, conceivably, even a car or train. That is, it lets objects of 
# different types respond to the same method invocation.

class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

# Sponges and Corals don't have a separate move method - they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| animal.move }
# Every new object in the animals array has access to a #move method, even
# the ones that don't actually move (Sponge and Coral).  This is because
# we've used a polymorphism strategy - we created an inert #move method in
# the Animal superclass which is accessible to all members of the Animal
# class.  Then we modify the functionality of that method for each Animal
# member that actually needs the ability to move.


# Every object in the array is a different animal, but the client code -- the 
# code that uses those objects -- doesn't care what each object is. The only 
# thing it cares about here is that each object in the array has a move method
# that requires no arguments. That is, every generic animal object implements 
# some form of locomotion, though some animals don't move. The interface for 
# this class hierarchy lets us work with all of those types in the same way even 
# though the implementations may be dramatically different. 
#
#                                                           That is polymorphism.