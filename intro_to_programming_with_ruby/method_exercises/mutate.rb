a = [1, 2 ,3]

# Example of a method definition that modifies its argument permanently
# While the scope of a method definition ies outside of the regular flow of program execution...
# ...the use of an action/method on the argument that mutates the caller (ie. a mutating method) 
# ...will permanently alter variables outside of the method definition's scope.
def mutate(array)
    array.pop
end 

puts "Before mutate method: #{a}"
puts mutate(a)
puts"After mutate method: #{a}"


b = ['a', 'b' ,'c']

# Example of a method definition that does not mutate the caller
def no_mutate(array)
    array.last
end 

puts "Before mutate method: #{b}"
puts no_mutate(b)
puts"After mutate method: #{b}"
