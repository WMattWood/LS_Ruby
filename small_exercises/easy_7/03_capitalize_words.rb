def word_cap(phrase)
  capitalized = phrase.split(' ')
  capitalized.each do |word|
    word.downcase!
    word[0] = word[0].upcase
  end

  capitalized.join(' ')
end

# Input: a string
# Output: a new string with all words capitalized
  # Rules: 
  # - any word starting with a letter must be capitalized
  # - non letters obv can't be capitalized
# Examples:
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# Data Structures: probably strings, maybe an array of strings.
# Algorithm:
  # - split the input string into separated words
  # - iterate through those words and capitalized the first letter of each word (idx[0])
  # - join the array together into a new string and return that
