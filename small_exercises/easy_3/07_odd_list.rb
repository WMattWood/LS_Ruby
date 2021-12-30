def odds(arr)
  output = []
  arr.each_with_index do |element, idx|
    output << element if idx.even?
  end
  output
end

# x_arr = [1, 2, 3, 4, 5, 6, 7]
# y_arr = ['lemon', 'banana', 'orange', 'apple', 'lime']

# p odds(x_arr)
# p odds(y_arr)

p odds([2, 3, 4, 5, 6]) == [2, 4, 6]
p odds([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p odds(['abc', 'def']) == ['abc']
p odds([123]) == [123]
p odds([]) == []