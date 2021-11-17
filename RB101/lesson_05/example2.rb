[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# Example 2
# .map is called on the outer array
# code block variable arr is assigned to the enumerables of the collection (ie. each inner array)
# .first is called by arr, returning idx[0] of each inner array
# puts prints a string representation of the return value of .first
# the return value of puts is used as the return value for the code block