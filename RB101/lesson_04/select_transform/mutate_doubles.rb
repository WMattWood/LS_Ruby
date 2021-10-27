my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(arr)
  counter = 0

  loop do
    break if counter == arr.size
    arr[counter] = arr[counter] * 2
    counter += 1
  end
  
  arr
end

p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]