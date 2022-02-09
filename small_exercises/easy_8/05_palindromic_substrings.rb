def leading_substrings(string)
  output = []
  (0...string.size).each do |idx|
    output << string[0..idx]
  end
  output
end

def substrings(string)
  output = []
  (0...string.size).each do |idx|
    output << leading_substrings(string[idx..-1])
  end
  output.flatten
end

def palindromes(string)
  substrings(string).select do |str| 
    str == str.reverse && str.size > 1
  end
end



p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]