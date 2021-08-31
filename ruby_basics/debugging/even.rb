numbers = [5, 2, 9, 6, 3, 1, 8]

# even_numbers = []
# numbers.map do |n|
#   even_numbers << n if n.even? 
# end

even_numbers = numbers.map do |n|
  n.even? ? n : next
end


p even_numbers # expected output: [2, 6, 8]