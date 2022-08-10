def select(array)
  counter = 0
  output = []

  while counter < array.size
    if yield(array[counter])
      output << array[counter]
    end
    counter += 1
  end

  output
end

array = [1, 2, 3, 4, 5]
# puts array.select { |num| num.odd? }
# puts array.select { |num| num.even? }
p array.select { |num| puts num }