def sentence_parse(text)
  sentences = File.read(text)
  sentences_array = sentences.split(/\.|!|\?/)
  words_arrays = sentences_array.map do |sentence|
    sentence.split
  end
  longest_sentence = []
  words_arrays.each do |word_array|
    if word_array.size > longest_sentence.size
      longest_sentence = word_array
    end
  end
  puts "The longest sentence is #{longest_sentence.size} words long."
  puts longest_sentence.join(' ')
end

sentence_parse('text1.txt')
sentence_parse('text2.txt')
# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end
# with periods (.), exclamation points (!), or question marks (?). Any sequence
# of characters that are not spaces or sentence-ending characters should be
# treated as a word. You should also print the number of words in the longest
# sentence.

# Input: A block of text
# Output: An integer value of the number of words contained in the longest
# sentence, as well as the sentence itself as a string.
  # Rules: 
  # - Sentences are delineated by (.), (!), or (?) symbols
  # - Any sequence of non spaces or sentence-ending characters are words
  # - (ie. per above, '--' is considered a word)
# Examples:  provided text1.txt file should return 86 words long
# Data Structure:  Ahhhh gonna try arrays
# Algorithm:
  # - take input text and split it into sentences based on /\.|!|\?/ delimiter
  # - split each sentence into an array of words
  # - store each of these word_arrays into a 2 dimensional array
  # - initialize an output array for the 'longest sentence'
  # - iterate over the 2 dimensional word_arrays array, test each word array...
    # - if the current word_array is longer in size than the longest sentence...
    # ...swap in the current word_array as the longest sentence.
  # - once we have our longest sentence stored in the output array...
  # ...print the longest_sentence.size value
  # ...print the longest sentence joined via a blank space char (' ')
### NOTE: This strips out input text of the delimiters!  
### An optional update to the code could allow us to store each sentence along
### with its delimiter in a hash, rather than an array... we can then perform our
### same algorithm, but on the keys or values of the hash only... then once selection
### is complete, we can revisit the associated delimiter value/key and tag it on to
### the end of the final output string.


