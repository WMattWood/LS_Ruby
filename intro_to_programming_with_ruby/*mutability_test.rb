# Working with the variable 'b' in the methods below may or may not modify the variable 'a' in the outer scope... 
# ...depending on whether or not we modify the ADDRESS SPACE IN MEMORY that 'a' is pointing to.  
# The use of a 'destructive method' which 'mutates the caller' (ie. 'a') would modify the ADDRESS SPACE IN MEMORY.

def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end 

def test_mutates(b)
  puts ""
  puts "Now with .map!"
  b.map! {|letter| "I like the letter: #{letter}"}
end 

a = ['a', 'b', 'c']
puts test(a)
p a

puts test_mutates(a)
p a