def word_lengths(string)
  words = string.split
  words.map! do |word|
    word + " #{word.length}"
  end
  words
end

# Input: a string
# Output: array that contains every word from the string plus a space and a word length value
# Rules: 
  # - each word is separated by one space
  # - any substring of non-space characters is a word.
# Example:
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
# Data Structure: array
# Algorithim
  # - split the string into an array of words
  # - iterate over the words array, transform each word to: itself + a space + it's own length
# - return the array