def leading_substrings(string)
  output = []
  characters = string.chars
  characters.each_with_index do |_, idx|
    output << characters[0..idx].join
  end
  output
end

# Input: A string
# Output: An array of strings 
  # Rules:
  # -output strings must be each successive leading substring starting at idx[0] of the input string
# Examples:
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# Data Structures: Output array
# Algorithm:
  # - Initialize the output array
  # - Convert the input string to an array of characters.
  # - iterate over the array of characters
    # - on each iteration, populate the output array with a string of 
    # index [(0..idx)]
  # - return the output array