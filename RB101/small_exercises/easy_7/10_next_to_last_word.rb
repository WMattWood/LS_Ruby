def penultimate(phrase)
  phrase.split[-2]
end

# Input: A string containing at least two words
# Output: A string containing only one word
  # Rules:
  # - Input string contains minimum of two words
  # - One word is considering any sequence of non-blank characters
  # - Output string is the '2nd to last' word of the input phrase
# Examples:
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
# Algorithm:
  # - split input string into an array of words
  # - return word at index -2
