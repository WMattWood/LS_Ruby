# For your answer to this exercise, write down your observations 
# for each group of code. After writing out those observations, 
# write one final analysis that explains the differences between 
# procs, blocks, and lambdas.



# # Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
# # Observations
# # A proc is a stored block of code.
# # It has a variable name.
# # A new proc can be initialized via assigning the returned object of a Proc#new method OR via
# # a call to the 'proc' keyword.
# # It can be called with the Proc#call method.
# # It can be passed an argument, which gets assigned to the method parameter of the associated block.

# # It has lenient arity - if an argument is not supplied for a corresponding block parameter, the value
# # of that parameter is simply set to nil.


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# # Observations: A lambda is also a proc!
# # It is of the Proc class.
# # It has a variable name.
# # A new proc can be initialized via assigning the returned object of a call to the lambda keyword
# # followed by a block, or the "=> (param) { block } syntax".
# # It can be called with the Proc#call method.
# # It can be passed an argument, which gets assigned to the method parameter of the associated block.

# # It has strict arity - if the wrong number of arguments is provided for the associated block, then
# # the lambda will raise an ArgumentError
# # Lambdas are not a class of their own.
# # Conclusion: lambdas are just Procs with strict arity.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')
# Observations:
# If you define a method with a yield keyword inside, you need to provide a block.
# However, the method does not pass the argument in to the block automatically.
# To get the method parameter into the yielded block, you must pass the method parameter into the
# yield as a param (ie. yield(param) )

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
# Observations
# With a method with a yield keyword which is passed in the method parameter, there
# is strict arity similar to a lambda. Any 