### Fix the program! ###

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3) # expand(3) - prior to ruby v2.7 private methods cannot be called by self
  end

  private # another solution here would be making this protected rather than private.

  def expand(n) 
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander