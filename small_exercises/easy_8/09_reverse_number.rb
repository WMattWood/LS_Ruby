def reversed_number(int)
  int.to_s.reverse.to_i
end

# Input: A positive integer
# Output: that number reversed
# Rules:  The output has to be a number, has to be reversed
# Examples:
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
# Data Structures: Will probably use an array as an interim stage to manipulate the number.
# - maybe not... can just use a string.
# Algorithm:
  # - convert input number to a string
  # - reverse that string
  # - convert that string to a number
  # - return the number.