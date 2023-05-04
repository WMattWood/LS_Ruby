def select(arr)

    counter = 0
    result = []

    while counter < arr.size
        result << arr[counter] if yield(arr[counter])
        counter += 1
    end

    result
end

array = [1, 2, 3, 4, 5]

puts select(array) { |num| num.odd? } === [1, 3, 5]
puts select(array) { |num| puts num} === []
puts select(array) { |num| num + 1 } === [1, 2, 3, 4, 5]
