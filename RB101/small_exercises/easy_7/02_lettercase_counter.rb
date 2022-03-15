def letter_case_count(str)
  lowercase_tally = 0
  uppercase_tally = 0
  neither_tally = 0
  output = {}

  str.chars.each do |char|
    case char
    when ('a'..'z')
      lowercase_tally += 1
    when ('A'..'Z')
      uppercase_tally += 1
    else
      neither_tally += 1
    end
  end

  output[:lowercase] = lowercase_tally
  output[:uppercase] = uppercase_tally
  output[:neither] = neither_tally

  output 
end


# Input: string
# Output: hash with three key:value pairs
  # Rules: 
  # - output hash contains three key:value pairs
  # - one for all lowercase letters ('a'..'z')
  # - one for all uppercase letters ('A'..'Z')
  # - one for all non-letters !('A'..'z')
# Examples:
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data Structures: strings and hash
# Algorithm:
  # - initialize three tally values (lowercase, uppercase, neither)
  # - convert input string to an array of characters
  # - iterate over input_string_array
  # - using a case statement, increase the right tally value depending on which case matches
  # - return a formatted hash of the three values