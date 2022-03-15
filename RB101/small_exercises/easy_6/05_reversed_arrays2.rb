### METHOD 1 ###
# def reverse(list)
#   new_array = Array.new(list.length)

#   list.each_with_index do |item, idx|
#     new_index = (idx + 1) * - 1
#     new_array[new_index] = item
#   end

#   new_array
# end

### METHOD 2 ###
# def reverse(list)
#   new_array = []

#   list.each_with_index do |item, idx|
#     new_array << list[(idx + 1) * - 1]
#   end

#   new_array
# end

### METHOD 3 ###
# def reverse(list)
#   list.map { |item| list[(list.index(item) + 1) * - 1] }
# end

### METHOD 4 ###
# def reverse(list)
#   list.inject([]) do |array_object, item| 
#     array_object.unshift(item) 
#   end
# end

### METHOD 5 ###
def reverse(list)
  list.each_with_object([]) do |item, array_object|
    array_object.unshift(item)
  end
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true