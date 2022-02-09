def multiply_all_pairs(arr1, arr2)
  output = []
  
  arr1.each do |num1|
    arr2.each do |num2|
      output << num1 * num2
    end
  end

  output.sort
end

# Input: Two arrays of integers
# Output: One array of integers sorted by ascending value
  # Rules: 
  # - Input arrays may be different sizes
  # - Input arrays will not be empty
  # - Output array must contain all possible products of the 
  # set of numbers provided in input arrays
  # - The output array values must be sorted by ascending value
# Examples:
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# Data Structure: Probably going to use a nested loop and an output array
# Algorithm:
  # - Initialize an empty output array
  # - interate through arr1
    # - On each iteration of arr1, iterate through arr2
      # - on each iteration of arr2, << the product of all arr2 integers with the arr1 integer at current index
  # - Sort the output array contents by ascending value
  # - Return the output array
