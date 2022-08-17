def count(arr)
  counter = 0
  true_count = 0

  while counter < arr.size
    true_count += 1 if yield(arr[counter])
    counter += 1
  end

  true_count
end

  

# tests
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2