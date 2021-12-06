def digit_list(num)
  if num.class == Integer
     separated_array = num.to_s.split('')
     separated_array.map {|x| x.to_i}
  else
    "digit_list invalid argument"
  end
end

# launch school brute force solution
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10) 
    # using divmod allows us to successively chop off the last digit, 
    # dividing by 10 and taking the remainder
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

# launch school idiomatic ruby solution
def digit_list3(number)
  number.to_s.chars.map(&:to_i)
  # (&:to_i) is shorthand syntactic sugar for { |char| char.to_i }
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# if you want to iterate over a number, it must be converted to a string
# then #split the string into an array using a ('') separator
# then we can call enumerable or array methods like #each or #map