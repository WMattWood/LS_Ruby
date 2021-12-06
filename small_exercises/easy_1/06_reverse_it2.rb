def reverse_words(sentence)
  array = sentence.split
  array.each {|word| word.reverse! if word.length >= 5}
  array.join(' ')
end

# launch school version - this is probably more efficient
# because the creation of the array and its modification
# are part of the same action. the array elements are 
# formatted as they go in the array. in my example these
# are separated into two different actions, which likely
# each need to step over the whole array... so I would 
# guess that my example the method would take 2x as long.
def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
  