require 'pry'

# Method using a second temporary array with reversed values
def reverse!(list)
  new_array = Array.new(list.length)

  list.each_with_index do |item, idx|
    new_index = (idx + 1) * - 1
    new_array[new_index] = item
  end

  new_array.each_with_index do |item, idx|
    list[idx] = item
  end

  list
end

# Method using a cache variable and flipping towards the center
def reverse!(list)
  leftmost = 0
  rightmost = -1

  (list.length / 2).times do 
    temp = list[leftmost]
    list[leftmost] = list[rightmost]
    list[rightmost] = temp
    leftmost += 1
    rightmost -=1
  end

  list
end

# Launchschool method using parallel assignment idiom
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end


# TESTS

list = [1,2,3,4]
result = reverse!(list)

p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true