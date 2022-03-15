def twice(num)
  double_number?(num) ? num : num * 2
end

def double_number?(num)
  num = num.to_s
  return false if num.size.odd?
  middle_index = num.size / 2
  num[0...middle_index] == num[middle_index..- 1]
end
    

# Input: an integer
# Output: an integer
  # Rules: 
  # - if the number is a 'double number', return the number.
  # - a double number is a number with the same digits in the 
  # same order on each side ie (7676, 334334, 55)
  # - if the number is not a 'double number', return the product
  # 0
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10