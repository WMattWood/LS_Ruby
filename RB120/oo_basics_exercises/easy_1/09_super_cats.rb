class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

# The Cat subclass passes up the two original arguments (name & age) to 
# the superclass version of the initialize method, where it gets processed 
# normally by the Pet superclass version of the initialize method...
# the remaining color argument is treated on its own.  It's kind of like
# calling the superclass method within the subclass method.

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Expected output
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.