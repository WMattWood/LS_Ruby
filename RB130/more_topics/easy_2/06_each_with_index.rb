# ## this was my original solution - but it would not work with
# ## any duplicate values in the provided array!!!
# def each_with_index(arr)
#   arr.each do |item|
#     yield(item, arr.find_index(item))
#   end
# end

## Launchschool solution
def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end

# test 1
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end
puts result == [1, 3, 6] # => true

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true


# test 2 (with a duplicate value in the array)
result2 = each_with_index([1, 3, 6, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end
puts result2 == [1, 3, 6, 6] # => true

# 0 -> 1
# 1 -> 3
# 2 -> 36
# 3 -> 216
# true