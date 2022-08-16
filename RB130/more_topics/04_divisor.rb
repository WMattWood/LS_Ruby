# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence
# you wish.

def divisors(input_number)
  limit = Math.sqrt(input_number)
  valid_range = (1..limit).to_a 

  output = valid_range.each_with_object([]) do |num, arr|
             if input_number % num == 0 && !arr.include?(num)
               arr << num
               arr << input_number / num if input_number / num != num
             end
           end
  
  output.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357] # may take several minute

# problem
# input: a positive integer
# output: an array containing all of the divisors of the input number

#Algorithm
# - generate an array of the range of numbers
# - 