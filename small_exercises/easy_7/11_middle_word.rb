def penultimate(phrase, lower_bound = true)
  return '' if phrase.empty?
  phrase = phrase.split
  if phrase.size.odd?
    middle_index = phrase.size / 2
  else
    middle_index = (lower_bound ? (phrase.size / 2 - 1) : (phrase.size / 2) )
  end
  phrase[middle_index]
end

# Input: A string
# Output: A string containing only one word
  # Rules:
  # - Input string may contain any number of words (including nothing)
  # - One word is considering any sequence of non-blank characters
  # - Output string is the 'middle' word of the input phrase
    # - The value of 'middle' is not defined - we will operate on the 
    # assumption that the requirement is for the lower of two possible
    # values given an even length string (ie. 'middle' value for string
    # with length of 4 will be considered to be 2)
  # - In order to accomodate for potential requirement of selection the
  # higher of two possible 'middle' values, we will include a flag for
  # 'lower_bound'.  If set to true we will prefer 2 as the middle position 
  # of 4 and if set to false we will prefer 3 as the middle position of 4.

# Examples:
p penultimate('last word') == 'last'
p penultimate('last word', false) == 'word'
p penultimate('') == ''
p penultimate('Launch School is so great!') == 'is'
p penultimate('Launch School good.') == 'School'
p penultimate('Launch School is so great yo!') == 'is'
p penultimate('Launch School is so great yo!', false) == 'so'
p penultimate('Launch School is so great yo!', true) == 'is'
# Algorithm:
  # - return empty string if no characters present in input string
  # - split input string into an array of words
  # - if odd number of words in the array, set middle index to number of words / 2
  # - if even number of words in the array, determine the 'middle index' based on 
  # - lower_bound argument (true/false)
    # - for even number of words, set a ternary operator to select between two ways
    # of finding the index: phrase.size / 2 - 1) : (phrase.size / 2)
  # - return word at 'middle index' of words array