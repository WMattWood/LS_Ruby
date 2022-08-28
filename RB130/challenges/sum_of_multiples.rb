#PEDAC
#Problem
# Input:  A natural number 'x', and a set of 2 or more numbers 'z1, z2, z3, etc.'.
# Output: the sum of the set of all multiples of 'z1..zn' less than 'x'


class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    # @number = number
    @multiples = (multiples.size > 0) ? multiples : [3, 5]
  end

  def to(num)
    output = []
    @multiples.each do |multiple|
      arr = (multiple...num).to_a.select { |x| x % multiple == 0 }
      output << arr
    end
    output.flatten.uniq.sum
  end

  def self.to(num)
    bof = SumOfMultiples.new
    bof.to(num)
  end
end

p SumOfMultiples.to(4)