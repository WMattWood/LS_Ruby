# Method 1 - replace method
greeting = 'Hello!'
greeting.replace('Goodbye!')
puts greeting

# Method 2 - gsub! method (substitution)
# #gsub! takes two arguments, and replaces instances of the first argument with the 2nd argument
greeting = 'Hello!'
greeting.gsub!('Hello!', 'Goodbye!')
puts greeting