def sum(number)
  digits = number.to_s.split('')
  digits = digits.map {|digit| digit.to_i }
  digits.reduce(:+)
end

# launch school alternate solution
def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

# launch school other alternate - sexy idiomatic ruby
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45