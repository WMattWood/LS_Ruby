def interleave(arr1, arr2)
  max_length = arr1.size > arr2.size ? arr1.size : arr2.size
  output = []
  counter = 0

  until counter == max_length do
    output.push(arr1[counter])
    output.push(arr2[counter])
    counter +=1
  end

  output
end

# Input: Two arrays arr1, arr2
# Output: One new array object, which contains all elements of the two input arrays.
  # Rules: 
  # - The new array must alternate between elements from arr1 and arr2, starting with the first element of arr1

  # Example:

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Data Structure: I think we will stick with arrays

# Algorithm:
  # - Initialize a new_array
  # - Initialize a counter
  # - Until the counter == the length of the longest array...
    # - Push an element into new_array from arr1
    # - Push an element into new_array from arr2
  # - Return the new_array

  