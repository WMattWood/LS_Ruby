# It is possible to set an argument to a default value
# It is ALSO possible to set that default value to reference prior arguments
# ...that is to say, accumulator (arg2) can access arr (arg1)
def reduce(arr, accumulator=arr[0])

    # If initial accumulator value is already the first element in the array,
    # then we can skip the step of reducing the first element of the array, so
    # we set the counter to [1] 
    if accumulator == arr[0]
        counter = 1
    else
        counter = 0
    end        

    while counter < arr.size
        accumulator = yield(accumulator, arr[counter])
        counter += 1
    end

    accumulator
end

array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num}
p reduce(array, 10) { |acc, num| acc + num}
# p reduce(array) { |acc, num| acc + num if num.odd? }
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
