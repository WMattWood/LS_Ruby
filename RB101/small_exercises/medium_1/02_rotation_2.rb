def rotate_rightmost_digits(int, n)
  str = int.to_s
  x = str.to_s.slice!(-n)
  str.concat(x)
  str.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Input: Two arguments, an integer to be rotated and n number of digits to rotate
# Output: A rotated integer
# Rules: 
  # - The input integer may be any length
  # - The first digit at the start of substring -n must be moved to the end
  # - mutation is moot because we are working with integers
# Examples: See above
# Data Structure: probably going to use strings and conversion (.to_i, .to_s)
# Algorithm:
  # - convert input integer to a string
  # - remove the character at index -n and assign it to a new variable
  # - concatentate character to end of string
  # - return string converted back to integer