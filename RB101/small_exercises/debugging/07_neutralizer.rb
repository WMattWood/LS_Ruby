def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

### SOLUTION ###
# The problem with this code is that the #neutralize method mutates the collection
# while it iterates over it. Doing this causes it to skip certain words in the 
# words array generated on line 002.

# One solution to this problem is to use a method like Array#select or Array#reject.

# The Array#reject method can be written out as follows: essentially the reject
# method performs EITHER a deletion, OR an iteration. It does not perform both
# operations on each element like what is happening on lines 003-005.

def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end