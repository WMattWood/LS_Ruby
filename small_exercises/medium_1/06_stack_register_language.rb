HELPFILE = File.read('06_stack_register_help.txt')

def prompt(msg)
  puts "=> #{msg}"
end

def minilang(commands)
  register = 0
  stack = []

  commands = commands.split
  commands.each do |command|
    case command
    when 'PUSH'
      stack.push(register)
    when 'ADD'
      register = register + stack.pop
    when 'SUB'
      register = register - stack.pop
    when 'MULT' 
      register = register * stack.pop
    when 'DIV'
      register = register / stack.pop
    when 'MOD'
      register = register % stack.pop
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    when 'HELP'
      puts HELPFILE
    else
      register = command.to_i
    end
  end
end

# INSTRUCTIONS
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# TESTS
# minilang('PRINT') == 0
# 0

# minilang('5 PUSH 3 MULT PRINT') == 15
# # 15

# minilang('5 PUSH POP PRINT') == 5
# # 5

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ') == 6
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ') == 12
# # 12

# minilang('-3 PUSH 5 SUB PRINT') == 8
# # 8

# minilang('6 PUSH') == ''
# # (nothing printed; no PRINT commands)

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8



prompt('Welcome to minilang.')
loop do 
  prompt('Please enter a command string. (Type exit to quit, or HELP for help.)')
  user_command = gets.chomp
  break if user_command.downcase == 'exit'
  minilang(user_command)
  prompt('Good... good... again!')
end

prompt('Later.')



# Further Exploration
# Try writing a minilang program to evaluate and print the result of this expression:

# Copy Code
# (3 + (4 * 5) - 7) / (5 % 3)
# The answer should be 8. This is trickier than it sounds! Note that we aren't asking 
# you to modify the #minilang method; we want you to write a Minilang program that can 
# be passed to #minilang and evaluated.

# Add some error handling to your method. In particular, have the method detect empty 
# stack conditions, and invalid tokens in the program, and report those. Ideally, the 
# method should return an error message if an error occurs, and nil if the program runs 
# successfully.