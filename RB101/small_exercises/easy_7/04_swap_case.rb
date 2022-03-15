def swapcase(string)
  swapped = string.chars.map do |letter|
    if letter =~ /[a-z]/
      letter.upcase
    elsif letter =~ /[A-Z]/
      letter.downcase
    else
      letter
    end
  end
  swapped.join
end

# Input: String
# Output: String with each character swapped for the alternate case.
  # Rules:
  # - the returned string must have each letter swapped for a new case 
  # - returned string is a new object.
# Examples:
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# Data Structures: two arrays containing necessary upper and lower case characters, with parallel indices
# Algorithm: