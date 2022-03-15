def show_multiplicative_average(num_array)
  x = num_array.reduce(:*).to_f / num_array.size.to_f
  '%.3f' % x
end

# Input: Array of integers
# Output: A floating point number displayed to 3 decimal places
  # Rules:
  # - The number must be displayed to 3 decimal places
  # - The number must be equal to the sum of all numbers in the input array 
  # divided by the total number of items in the array.
# Examples:
p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
# Data Structures: I think just an array
# Algorithm:
  # - multiply all numbers in the array - as FLOATS
  # - divide by the array size
  # - format the evaluated value to 3 decimal places