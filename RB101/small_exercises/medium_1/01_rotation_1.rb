# Write a method that rotates an array by moving the first element to the end of the array. 
# The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Rules
# Input: Array
#   -make a copy of the array
#   -remove 1st element from new_array idx[0]
#   -add 1st element to end of new_array
# Output: New array
#   -return new_array

x = [1, 2, 3, 4]
def rotate_array(arr)
  new_array = arr.dup
  new_array.push(new_array.shift)
  new_array
end

def rotate_string(str)
  rotated_chars = rotate_array(str.chars)
  rotated_chars.join
end

def rotate_integer(int)
  rotated_digits = rotate_array(int.to_s.chars)
  rotated_digits.join.to_i
end

# Example
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
p rotate_string("Happy to see you")
p rotate_integer(12345)