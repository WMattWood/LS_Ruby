def uppercase?(string)
  string == string.upcase
end

# Input: a string
# Output: a boolean
  # Rules: all letters in the string must be uppercase to return true
# Examples:
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
# Data Structures: strings
# Algorithm:
  # - check if the input string matches self.upcase