greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => ???

# 006 => {:a=>'hi there'}
# on line 002 informal_greeting is assigned to a element of the greetings hash.
# because the informal_greeting variable still directly references that hash
# element, when a mutating operator << is called on informal_greeting, the hash
# object greetings has one of its elements mutated as well.  So when we next
# call the greetings hash, we can see that its element has been mutated as well.

# Alternative options

informal_greeting = greetings[:a].clone  #produces a new object with the .clone method
informal_greeting = informal_greeting + ' there'
informal_greeting = informal_greeting.concat(' there')  #concatenation produces a new string, does not mutate the caller