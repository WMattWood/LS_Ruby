def short_long_short(str1, str2)
  compare = str1.size <=> str2.size
  output = ''
  case compare
  when 1
    output << "#{str2}" + "#{str1}" + "#{str2}"
  when -1
    output << "#{str1}" + "#{str2}" + "#{str1}"
  else
    output << "They are the same."
  end
  
  output
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"