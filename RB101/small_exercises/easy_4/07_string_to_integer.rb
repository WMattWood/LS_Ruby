### String to Ingeger version, with #each and #reduce options ###
DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(str)
  integer_array = str.chars.map { |char| DIGITS[char] }
  
  # output = 0
  # integer_array.each { |digit| output = 10 * output + digit }
  # output
  integer_array.reduce { |int1, int2| int1 * 10 + int2 }
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

### Hexidecimal to Integer version, with #each and #reduce options ###
HEXADECIMAL = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}

def hex_to_integer(hex)
  hex = hex.downcase
  hex_array = hex.chars.map { |char| HEXADECIMAL[char] }

  # output = 0
  # hex_array.each { |digit| output = 16 * output + digit }
  # output
  hex_array.reduce { |char1, char2| char1 * 16 + char2} 
end

p hex_to_integer('4D9f') == 19871