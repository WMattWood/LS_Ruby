# def leading_substrings(string)
#   output = []
#   characters = string.chars
#   characters.each_with_index do |_, idx|
#     output << characters[0..idx].join
#   end
#   output
# end

# def substrings(string)
#   output = []
#   characters = string.chars
#   characters.each_with_index do |_, idx|
#     output << leading_substrings(characters[idx..-1].join)
#   end
#   output.flatten
# end

### REFACTORED TO USE (0...string.size).each as iterator
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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]