# Bad form but technically possible - simply inherit methods from Array class.

# ### Bad Form ###
# class FixedArray < Array
# end

class FixedArray
  def initialize(num)
    @array = Array.new(num)
    @array_size = num
  end

  def [](idx)
    valid_index?(idx)
    array[idx]
  end

  def []=(idx, object)
    valid_index?(idx)
    array[idx] = object
  end

  def to_a
    array
  end

  def to_s
    array.to_s
  end

  private

  def valid_index?(index)
    raise IndexError if index >= array_size
  end

  attr_accessor :array
  attr_reader :array_size
end


# Write a class that implements a fixed-length array, and provides the
# necessary methods to support the following code:

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end