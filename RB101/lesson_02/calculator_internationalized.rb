# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
  word
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do # name loop
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do  
    operator = Kernel.gets().chomp()
    
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_operator', LANGUAGE))
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
          when '1'
            number1.to_i() + number2.to_i()
          when '2'
            number1.to_i() - number2.to_i()
          when '3'
            number1.to_i() * number2.to_i()
          when '4'
            number1.to_f() / number2.to_f()
          end

  prompt("The result is #{result}")

  prompt(messages('go_again'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('goodbye', LANGUAGE))