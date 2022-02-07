require "pry"

def word_sizes(phrase)
  wordcount = Hash.new(0)
  return wordcount if phrase.length == 0

  words = phrase.split(' ')
  words.each do |word|
    wordsize = 0
    word.chars.each do |char|
      wordsize += 1 if ('A'..'z').include?(char)
    end
    wordcount[wordsize] += 1
  end
  wordcount
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# Input: String
# Output: A hash with keys equaling wordsizes, and values equaling the count of words of that specified size.
# Initialize an output hash
# Split the string into a word_array of individual words separated by blank spaces ' '
# For each word in word_array, initialize a wordsize variable, and iterate over each character 
# add 1 to the value of key[wordsize] in the output hash for each valid character ('A'..'z') 
# Return the output hash