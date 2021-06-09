def space_out_letters(person)
  return person.split("").join(" ")
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts "" + greet(person) + ""
end

decorate_greeting("John")
decorate_greeting(1)

# line 14 produces the following error
# it shows how the call trace starts at line 14 with the decorate_greeting call (within main context)
# it then goes to line 10 with the greet call (within decorate_greeting context)
# it then goes to line 6 with the split method throwing an error (inside the space_out_letters context)

#Traceback (most recent call last):
#        3: from /home/ec2-user/environment/LS_Ruby/scratch/*greeting_error.rb:14:in `<main>'
#        2: from /home/ec2-user/environment/LS_Ruby/scratch/*greeting_error.rb:10:in `decorate_greeting'
#        1: from /home/ec2-user/environment/LS_Ruby/scratch/*greeting_error.rb:6:in `greet'
#/home/ec2-user/environment/LS_Ruby/scratch/*greeting_error.rb:2:in `space_out_letters': undefined method `split' for 1:Integer (NoMethodError