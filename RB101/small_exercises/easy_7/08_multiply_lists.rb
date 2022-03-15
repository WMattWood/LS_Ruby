def multiply_list(arr1, arr2)
  output = []
  0.upto(arr1.size - 1) do |idx|
    output << arr1[idx] * arr2[idx]
  end
  output
end

# Input: Two arrays containing the same number of integers
# Output: One array containing the product of each pair of integers 
# from both arrays that share the same index value
  # Rules: Gotta multiply each pair with the same index
# Examples
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# Data Structures: Two arrays - could do it with nested arrays but maybe no.
# Algorithm:
  # - Initialize an output array
  # - Set up a loop with a counter value equal to the size of both arrays 
  # - On each loop n, << the product of elements at index n into the output array
  # - Return the output array
