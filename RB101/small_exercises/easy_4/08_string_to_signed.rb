DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(str)
  integer_array = str.chars.map { |char| DIGITS[char] }
  integer_array.reduce { |int1, int2| int1 * 10 + int2 }
end

def string_to_signed_integer(str)
  if str[0] == '-'
    str = str.delete_prefix('-')
    string_to_integer(str) * -1
  elsif str[0] == '+'
    str = str.delete_prefix('+')
    string_to_integer(str)
  else
    string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100