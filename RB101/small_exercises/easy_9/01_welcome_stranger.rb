def greetings(array, hash)
  "Hello, #{array[0]} #{array[1]} #{array[2]}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

# Input: 2 arguments, an array and a hash
# Output: A string which interpolates the elements from the array and the values from the hash.

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.