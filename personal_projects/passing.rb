# As demonstrated in this code, calling assignment on individual elements
# of a collection will modify the original 'collection object'.  However,
# calling assignment on a specific object or variable does not mutate the 
# calling object.  Difference between COLLECTIONS and OBJECTS.

def banana(arg)
  if arg.class == String
    arg += " is a banana."
  elsif arg.class == Array 
    arg.each_index { |idx| arg[idx] +=  " is a banana." }
  elsif arg.class == Hash
    arg.each { |key, value| arg[key] += " is a banana." }
    # arg.each { |key, value| puts value }
  end
end

str = "The lemon"
arr = ["The lemon", "The mango", "The berry"]
hash = {lemon: "The lemon", mango: "The mango", berry: "The berry"}

# p str.class
# p arr.class
# p hash.class

# method called on a string
puts "___Method called on a string___"
puts "Before: #{str}"
puts banana(str)
puts "After: #{str}"

# method called on an array
puts "___Method called on an array___"
puts "Before: #{arr}"
puts banana(arr)
puts "After: #{arr}"

# method called on a hash
puts "___Method called on a hash___"
puts "Before: #{hash}"
puts banana(hash)
puts "After: #{hash}"