# Write a method that takes a sorted array of integers as an argument, and 
# returns an array that includes all of the missing integers (in order) between 
# the first and last elements of the argument.

def missing(arr)
  low = arr.min
  high = arr.max
  working_range = (low..high).to_a
  arr.each { |num| working_range.delete(num) }
  working_range
end


#tests
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []


#Problem
#input: an array of integers, positive or negative
#output: an array of the numbers that are missing from the range between
# the lowest and highest number in that sequence, sorted.

#Algorithm
#find lowest and highest number
#produce a range of numbers from that lowest to the highest number
#that range will be automatically sorted, so no sort should be necessary at the end
#iterate through the original array, and remove each integer that appears in
# the original array from the output array.
# return the output array