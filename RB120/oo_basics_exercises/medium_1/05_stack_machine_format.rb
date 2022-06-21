class InvalidToken < StandardError; end
class EmptyStack < StandardError; end

class Minilang
  VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(input_string)
    @stack = Array.new
    @register = 0
    @program = input_string.split
  end

  def eval
    program.each do |command|
      if valid_integer?(command)
        self.register = command.to_i
        next
      end

      if valid_token?(command)
        self.send(formatted_cmd(command))
      else
        invalid_token(command)
        break
      end
    end
  end

  private

  def execute_push
    stack.push register
  end

  def execute_add
    empty_stack?
    self.register = register + stack.pop
  end

  def execute_sub
    empty_stack?
    self.register = register - stack.pop
  end

  def execute_mult
    empty_stack?
    self.register = register * stack.pop
  end

  def execute_div
    empty_stack?
    self.register = register / stack.pop
  end

  def execute_mod
    empty_stack?
    self.register = register % stack.pop
  end

  def execute_pop
    empty_stack?
    self.register = stack.pop
  end

  def execute_print
    puts register if register
  end
  
  attr_reader :program
  attr_accessor :register, :stack

  def valid_integer?(str)
    str.to_i.to_s == str
  end

  def valid_token?(str) 
    VALID_TOKENS.include?(str)
  end

  def formatted_cmd(str)
    "execute_#{str.downcase}"
  end

  def invalid_token(str)
    begin
      raise InvalidToken, "Invalid token: #{str}"
    rescue => e
      puts e.message
    end
  end

  def empty_stack?
    begin
      raise EmptyStack, "Empty Stack!" if stack.empty?
    rescue => e
      puts e.message
    end
  end
end


### Problem ###
  # Write a language with the following commands
  #   n Place a value n in the "register". Do not modify the stack.
  #   PUSH Push the register value on to the stack. Leave the value in the register.
  #   ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
  #   SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
  #   MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
  #   DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
  #   MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  #   POP Remove the topmost item from the stack and place in register
  #   PRINT Print the register value

### Examples ###
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)