statement = "The Flintstones Rock"

# .each_with_object method
list = statement.chars.each_with_object({}) do |letter, letters_hash|
  next if letter == " "
  if letters_hash.include?(letter)
    letters_hash[letter] += 1
  else
    letters_hash[letter] = 1
  end
end

# .each_with_object method ternary format
list2 = statement.chars.each_with_object({}) do |letter, letters_hash|
  next if letter == " "
  letters_hash.include?(letter) ? letters_hash[letter] += 1 : letters_hash[letter] = 1
end

# creating an array of all valid output values and comparing string to that array
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

p list
p list2
p result