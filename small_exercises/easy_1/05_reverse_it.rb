def reverse_sentence(sentence)
  words_array = sentence.split(' ')
  words_array.reverse.join(' ')
end

# launch school idiomatic version
# because String#split does not require a (' ') blank space operator
def reverse_sentence2(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''