my_numbers = [1, 4, 3, 7, 2, 6]

def multiply_numbers(arr, factor)
  counter = 0
  new_array = []

  loop do
    break if counter == arr.size
    new_array << arr[counter] * factor
    counter += 1
  end
  
  new_array
end

p multiply_numbers(my_numbers, 0)
p multiply_numbers(my_numbers, 2)
p multiply_numbers(my_numbers, 3)
p multiply_numbers(my_numbers, 4)