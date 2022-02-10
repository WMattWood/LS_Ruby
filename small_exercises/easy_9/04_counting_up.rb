def sequence(num)
  output = []
  1.upto(num) do |number|
    output << number
  end
  output
end

# Input: integer
# Ouput: array of numbers from 1 to that number
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]