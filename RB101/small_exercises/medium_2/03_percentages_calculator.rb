def letter_percentages(str)
  lowercase_tally = 0
  uppercase_tally = 0
  neither_tally = 0
  total_chars = str.chars.size.to_f
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

  output[:lowercase] = lowercase_tally.to_f / total_chars * 100
  output[:uppercase] = uppercase_tally.to_f / total_chars * 100
  output[:neither] = neither_tally.to_f / total_chars * 100

  output 
end

# Input: String
# Output: Hash containing three pairs, storing the percentage occurences of three 
# types of character (lowercase, uppercase, neither)
  # Rules: 
  # - percentages to be stored as float values ( '%.1f' % float )
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
