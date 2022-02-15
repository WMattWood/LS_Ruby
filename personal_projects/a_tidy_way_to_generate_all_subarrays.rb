def subarrays(array)
  output = []
  (0...array.size).each do |idx|
    output << leading_subarrays(array[idx..-1])
  end
  output
end

def leading_subarrays(array)
  output = []
  (0...array.size).each do |idx|
    output << array[0..idx]
  end
  output
end

p subarrays([1, 2, 3, 4]) == [
  [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]], 
  [[2], [2, 3], [2, 3, 4]], 
  [[3], [3, 4]], 
  [[4]]
]

p subarrays('abcde') == [
  ['a', 'ab', 'abc', 'abcd', 'abcde'],
  ['b', 'bc', 'bcd', 'bcde'],
  ['c', 'cd', 'cde'],
  ['d', 'de'],
  ['e']
]