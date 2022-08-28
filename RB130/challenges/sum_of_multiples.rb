#PEDAC
#Problem
# Input:  A natural number 'x', and a set of 2 or more numbers 'z1, z2, z3, etc.'.
# Output: the sum of the set of all multiples of 'z1..zn' less than 'x'


class SumOfMultiples
  attr_reader :multiples

  def initialize(number, *multiples)
    @number = number
    @multiples = (multiples.size > 0) ? multiples : [3, 5]
  end

end

bof = SumOfMultiples.new(9)
p bof.multiples

dof = SumOfMultiples.new(9, 5, 6, 7, 8, 9)
p dof.multiples