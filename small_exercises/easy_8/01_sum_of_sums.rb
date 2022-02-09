def sum_of_sums(arr)
  subsequences = []
  ### Populating the array with the set of leading subsequences
  arr.each_with_index do |num, idx|
    subsequences << arr[(0..idx)]
  end

  ### Summing the subsequences in place
  subsequences.map! do |subsequence|
    subsequence.reduce(:+)
  end

  ### Summing the sums of all subsequences
  subsequences.sum
end

# Input: An array containing a non-zero number of integers
# Output: An integer equal to the sum of the sum of each 'leading subsequence' 
# of the input array
  # Rules: 
  # - the contents of 'leading subsequences' of the input array is the integers
  # containg within each range (0..n) of indexes, with n increasing by 1 each time
  # until the final index [-1]
  # - the input array will not contain less than one integer.
# Examples:
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
# Data Structure: Likely a nested array to contain each subsequence.
# Algorithm
  # - Initialize an empty subsequence array.
  # - Generate a set of subsequences from the input array
  # - << those subsequences into the sub sequence array
  # - Iterate through the subsequnce array and calculate the sum of each subsequence
  # - Add the sums of each subsequence together and return that value.
