# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


# SOLUTION:
#
# input: string
# output: new string (not the same object)
# rules:
#     Explicit requirements:
#       - must return an array containing all substrings which are palindromes
#       - palindromes are case sensitive (ie. 'Ada' is not a palindrome, 'ada' is.)

#     Implicit requirements:
#       - the returned string shouldn't be the same object.
#       - if input is an empty string, the result should be an empty string.
#       - returned value should be an array



def palindrome_substrings(str)
  palindromes = []
  substring_array = substrings(str)
  substring_array.each do |item|
    if is_palindrome?(item)
      palindromes << item
    end
  end
  palindromes
end


def substrings(str)
  result = []
  starting_index = 0
  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  return result
end

def is_palindrome?(str)
  str.reverse == str
end

p palindrome_substrings("supercalifragilisticexpialidocious") # ["ili"]
p palindrome_substrings("abcddcbA") # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome")
p palindrome_substrings("")