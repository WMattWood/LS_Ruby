class Triangle
  attr_reader :kind

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @sides = [@s1, @s2, @s3]
    @kind = determine_kind
  end

  def determine_kind
    size_is_illegal?
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?
    'scalene'
  end

  def equilateral?
    @s1 == @s2 && @s2 == @s3
  end

  def isosceles?
    @s1 == @s2 || @s2 == @s3 || @s3 == @s1
  end

  def size_is_illegal?
    raise ArgumentError if @sides.include?(0) || 
                           @sides.any? {|x| x < 0} ||
                           @s1 + @s2 <= @s3 ||
                           @s1 + @s3 <= @s2 ||
                           @s2 + @s3 <= @s1
  end
end

# bof = Triangle.new(0, 3, 4)