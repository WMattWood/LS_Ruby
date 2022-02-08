require 'pry'

def find_fibonacci_index_by_length(number_length)
  fibonacci_stage = 2
  current_set = [1, 1]
  loop do 
    next_num = current_set.sum
    fibonacci_stage += 1
    break if next_num.to_s.length == number_length
    current_set.shift
    current_set.push(next_num)
  end
  fibonacci_stage
end


# Input: Integer (value n)
# Output: Integer (first value in fib sequence of 'n' length)

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847