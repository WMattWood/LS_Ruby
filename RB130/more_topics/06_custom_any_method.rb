def any?(arr)
  counter = 0

  while counter < arr.size
    return true if yield(arr[counter])
    counter += 1
  end

  false
end

# if we coded this with the #each method instead of a while loop based
# on the Array#size method, then it would work for any enumerable 
# collection!

# tests
p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false