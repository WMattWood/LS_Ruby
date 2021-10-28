the_truth = 'the flinstones rock'

# discount version of 'titleize' method from Rails
def titleizer (str)
words = str
capital_words = ""
last_char = ""

words.chars.each_with_index do |character, index|
  if index == 0 || last_char == " "
    capital_words << character.upcase
  else
    capital_words << character
  end
  last_char = character
end

capital_words
end

# way better version
def better (str)
  words = str
  capitalized = words.split.map { |word| word.capitalize }.join(' ')
  capitalized
end

# puts titleizer(the_truth)
# puts titleizer("the truth")
# puts titleizer('ehadsf asdfjhdsf SEAHFL asdfhlksd f ASDFH le')

puts better(the_truth)