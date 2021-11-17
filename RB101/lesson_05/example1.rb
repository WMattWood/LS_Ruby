[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

#### Example 1
# .each is called on the outer array of a 2d array
# the block variable arr is assigned to each inner array
# the code block calls .first on each inner array
# the code block then calls puts on the return value of .first, which is idx[0] of each internal array in the collection
# idx[0] of each array (1 and 3) are printed
#
# puts is the last method called in the code block, and puts' return value is nil
# this means that the code block's return value is also nil
# because we are using .each the return method is basically ignored.  the .each
# method returns the original array

# __methods__
# .each
# .first
# puts

# __objects__
# outer array
# inner arrays
# code block