def crunch(str)
  buffer = ''
  output = []
  str.chars.each do |char|
    output << char unless char == buffer
    buffer = char
  end
  output.join
end



p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''