class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.chars.map{ |x| x.to_i }
  end

  def slices(number)
    raise ArgumentError if number > @numbers.size
    output = []
    idx = 0

    until idx + number > @numbers.size do
      output << @numbers[idx...(idx + number)]
      idx += 1
    end
    
    output
  end
end