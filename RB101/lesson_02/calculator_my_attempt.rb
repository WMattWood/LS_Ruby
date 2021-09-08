Kernel.puts("Please enter two numbers. \nFirst number: ")
number_1 = Kernel.gets().chomp()

while number_1.to_i.to_s != number_1
  Kernel.puts("Sorry, please write in numerical format (0-9). \nFirst number: ")
  number_1 = Kernel.gets().chomp()
end
  
  
Kernel.puts("Thank you. \nNow the second number: ")
number_2 = Kernel.gets().chomp()

while number_2.to_i.to_s != number_2
  Kernel.puts("Sorry, please write in numerical format (0-9). \nSecond number: ")
  number_2 = Kernel.gets().chomp()
end

Kernel.puts("Thank you. \nWould you like to... \n\n 1) ADD\n 2) MULTIPLY\n 3) DIVIDE\n 4) SUBTRACT\n\nPlease enter a command from the above list: ")
operation = Kernel.gets().chomp().upcase!

while operation != 'ADD' && operation != 'MULTIPLY' && operation != 'DIVIDE' && operation != 'SUBTRACT'
  Kernel.puts("\nINVALID COMMAND!!!\n\n 1) ADD\n 2) MULTIPLY\n 3) DIVIDE\n 4) SUBTRACT\n\nPlease enter a command from the above list:")
  operation = Kernel.gets().chomp().upcase!
end

case operation
  when 'ADD'
    result = number_1.to_i + number_2.to_i
    Kernel.puts("\nYour answer is: #{number_1} + #{number_2} = #{result}")
  when 'MULTIPLY'
    result = number_1.to_i * number_2.to_i
    Kernel.puts("\nYour answer is: #{number_1} * #{number_2} = #{result}")
  when 'DIVIDE'
    result = number_1.to_i / number_2.to_i
    Kernel.puts("\nYour answer is: #{number_1} / #{number_2} = #{result}")
  when 'SUBTRACT'
    result = number_1.to_i - number_2.to_i
    Kernel.puts("\nYour answer is: #{number_1} - #{number_2} = #{result}")
  else
    Kernel.puts("How did you even get here?")
end

