# MERGE WITH MUTATION OF INPUT ARRAYS
def merge(arr1, arr2)
  output = []

  while arr1.size > 0 && arr2.size > 0
    arr1[0] > arr2[0] ? output << arr2.shift : output << arr1.shift
  end

  while arr1.size > 0
    output << arr1.shift
  end

  while arr2.size > 0
    output << arr2.shift
  end
      
  output
end

# DIFFERENT WAY OF DOING THE SAME THING, BUT NO MUTATION
# def merge(arr1, arr2)
#   output = []
#   index2 = 0

#   arr1.each do |value|
#     while index2 < arr2.size && arr2[index2] <= value
#       output << arr2[index2]
#       index2 += 1
#     end

#     output << value
#   end

#   p output.concat(arr2[index2..-1])
# end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# input: two sorted arrays of integers
# output: one single array which contains all integers from both arrays in a sorted order
# RULES: cannot call #sort on the final output array
#        the output array must be built one element at a time.
#        cannot mutate the input arrays

# EXAMPLES
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# DATA STRUCTURE
# as per the answer... simultaneous walking through both arrays. each iteration
# takes the current index in array 1, compares it to each value in array 2, and
# pushes in the array 2 value when the array 2 value is less than the current
# array 1 value, and iterates up one index.  This continues for as long as the
# array 2 values are less than or equal to the current index of array 1. Once
# the current index value of array 2 is GREATER than the current array 1 value,
# that greater array 1 value is pushed into the result array. 

# at the end, whatever values remain from index 2 are assumed to be of a higher
# value than any values in the result array (and sorted) so the remainder of the
# array 2 is concatenated to the currently populated result array.