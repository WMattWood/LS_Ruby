def repeater(string)
  output = ''
  (0...string.size).each do |index|
    output << ( string[index] * 2)
  end
  output
end 
# Input: String
# Output: New string 
  # Rules: 
  # - New string must have a double of each character in the input string
# Examples:
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Data Structure: Strings
# Algorithm: 
  # Initialize output string
  # Use upto to iterate through the input string's indexes
  # For each index, append a new character to the output string
  # Return output string