# Instead of using #each_with_index...
# use (0...array.size).each do |index|
# NOTE: This implementation of the (0..9) range syntax uses THREE DOTS so 
# it is exclusive of the upper bound... (0...9) = 0,1,2,3,4,5,6,7,8

### TIDY AF ###
def leading_substrings(string)
  output = []
  (0...string.size).each do |index|
    output << string[0..index]
  end

  output
end

### NOT SO TIDY
def leading_substrings(string)
  output = []
  string.chars.each_with_index do |_, index|
    output << string.chars[0..index].join
  end
  
  output
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']