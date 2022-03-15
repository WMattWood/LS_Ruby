def merge (arr1, arr2)
  (arr1 + arr2).uniq
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# Input: Two arrays containing integers
# Output: One single array containing integers
# Rules: 
  # - The output array cannot contain any duplicate integers.
  # - The output array must contain all of the unique numbers from the two input arrays.
# Data Structure:  Arrays all the way.

# Algorithm: 
  # - Concatenate both arrays together
  # - Remove any duplicate values.