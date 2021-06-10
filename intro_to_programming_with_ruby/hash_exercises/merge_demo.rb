hash_one = {a: 20, b: 30, c: 40, d: 50}
hash_two = {d: 51, e: 61, f: 71, g: 81}

puts "First we do a .merge ...poof."
hash_one.merge(hash_two)
puts "Hash_one looks like this: #{hash_one}"
puts "Hash_two looks like this: #{hash_two}"

puts "Next we do a .merge! ...shazam!"
hash_one.merge!(hash_two) {|key, hash1, hash2| hash2 = "splat" }
puts "After a destructive merge! ...hash_one looks like this: #{hash_one}"
puts "After a destructive merge! ...hash_two looks like this: #{hash_two}"