def substrings(string)
  output = []
  (0...string.size).each do |idx|
    output << leading_substrings(string[idx..-1])
  end
  output.flatten
end

def leading_substrings(string)
  output = []
  (0...string.size).each do |idx|
    output << string[0..idx]
  end
  output
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

p substrings([1, 2, 3, 4]) == [1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 2, 2, 3, 2, 3, 4, 3, 3, 4, 4]
