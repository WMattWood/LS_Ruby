def anagrams(words)
  output = {}

  words.each do |word|
    key = word.chars.sort.join
    # words.each do |word|
    #   if word.chars.sort.join == key
    #     output.has_key?(key) && !output[key].include?(word) ? 
    #     output[key].push(word) :
    #     output[key] = [word]
    #   end
    # end
    if output.has_key?(key)
      output[key].push(word)
    else
      output[key] = [word]
    end
  end
  
  output.each do |key, value|
    puts "#{output[key]}"
  end
end

# def is_anagram?(word1, word2)
#   word1.chars.sort == word2.chars.sort
# end

# Input: An array of strings
# Output: prints arrays which are anagrams of each other
# Rules:  
  # - The method must print out arrays of the anagrams
  # - The method must find all anagrams in the provided array
  # - There will be more than one set of anagrams
# Examples:
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
'flow', 'neon']
# Data Structure: I will use a nested array
# Algorithm:

anagrams(words)