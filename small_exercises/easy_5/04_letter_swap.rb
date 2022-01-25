def letter_swap(str)
  array_of_words = str.split(' ')
  array_of_words.map! do |word|
    first_letter = word.chars.first
    last_letter = word.chars.last
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  array_of_words.join(' ')
end

p letter_swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p letter_swap('Abcde') == 'ebcdA'
p letter_swap('a') == 'a'