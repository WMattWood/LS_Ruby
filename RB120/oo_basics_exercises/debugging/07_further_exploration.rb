class Test
  attr_reader :name, :height

  def initialize(name, height)
    @name = name
    @height = height
  end

  def name=(argument)
    @name = argument.upcase
    "burt"
  end

  def test_assign
    variable = (name="jenkins test")
    p variable
  end
end

mark = Test.new("Marcus Aurelius", 15)
p mark.name
p mark.height

mark.name = "Montgomery"
p mark.name

mark.test_assign
p mark.name