DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def word_to_digit(string)
  DIGIT_HASH.each do |written_number, digit|
    string.gsub!(written_number, digit)
  end
  string
end

BORK_HASH = {
  'zero' => 'boom', 'one' => 'bing', 'two' => 'bork', 'three' => 'boing', 'four' => 'bim',
  'five' => 'bam', 'six' => 'blep', 'seven' => 'berp', 'eight' => 'bop', 'nine' => 'bong'
}

def word_converter(string, conversion_hash)
  conversion_hash.each do |string_to_match, string_to_replace|
    string.gsub!(string_to_match, string_to_replace)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_converter('Please call me at five five five one two three four. Thanks.', BORK_HASH) #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
