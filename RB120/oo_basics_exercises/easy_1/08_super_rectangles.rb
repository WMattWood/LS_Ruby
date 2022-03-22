class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length_of_side)
    super(length_of_side, length_of_side)
end

# The Square subclass passes up the single length_of_side argument to 
# the superclass, where it gets passed in like a regular call to the 
# initialize method of the Rectangle class. (the trick here is that 
# the single length_of_side argument is subbed in for both the height
# and width parameters.)



square = Square.new(5)
puts "area of square = #{square.area}"