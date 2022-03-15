def fizzbuzz(start, finish)
  start.upto(finish) do |int|
    if int % 3 == 0 && int % 5 == 0
      puts 'FizzBuzz'
    elsif int % 3 == 0
      puts 'Fizz'
    elsif int % 5 == 0
      puts 'Buzz'
    else
      puts int
    end
  end
end

# Input: Two integers
# Output: Printed strings
# Write a method that takes two arguments: 
# the first is the starting number, and the second is the ending number. 
# Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", and finally 
# if a number is divisible by 3 and 5, print "FizzBuzz".
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz