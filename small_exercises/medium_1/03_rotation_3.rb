require 'pry'

def max_rotation(number)
  number = number.to_s
  number.size.downto(1) do |idx|
    number = rotate_rightmost_digits(number.to_i, idx).to_s
  end
  number.to_i
end

def rotate_rightmost_digits(int, n)
  str = int.to_s
  x = str.to_s.slice!(-n)
  str.concat(x)
  str.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Input: integer
# Output: maximumly rotated integer
  # Rules: rotate to the maximum degree
# Examples: See above
# Data Structure: not really
# Algorithm:
  # - rotate the number from index [-num.length]
  # - 