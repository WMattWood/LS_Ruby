def center_of(string)
  middle_index = string.size / 2
  string.size.even? ? string[middle_index - 1..middle_index] : string[middle_index]
end


# Input: a string
# Output: 1 or 2 character string.
  # Rules: 
  # - return 1 character if the string has odd number of chars
  # - return 2 characters if the string has even number of chars
  # - return the center/middle characters of the string
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

# Data Structures:  strings
# Algo:
  # - find the middle index
  # - if string is even, return middle index and middle index + 1
  # - if string is odd, return middle index
