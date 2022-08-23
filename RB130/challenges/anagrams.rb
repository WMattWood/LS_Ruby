class Anagram

  LETTERS = ('a'..'z').to_a

  def initialize(string)
    @string = string
  end

  def match(list)
    list.select do |word|
      next if word.downcase == @string.downcase
      char_count(@string) == char_count(word)
    end
  end

  def char_count(str)
    count_hash = LETTERS.to_h { |letter| [letter, 0] }
    str.chars.each do |letter|
      count_hash[letter.downcase] += 1
    end
    count_hash
  end
end

#INPUT
# array of strings
#OUTPUT
# array containing only the strings which are anagrams of the base string

#RULES
# an anagram must contain all the letters from the base string
# an anagram must contain only the letters from the base string
# there must be the same quantity of letters

