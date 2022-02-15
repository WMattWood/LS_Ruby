def transpose(matrix)
  matrix = matrix.map do |row|
             new_row = row.dup
           end
 
  addresses = Array.new(3) { |index| index }
  
  matrix.size.times do
    addresses.rotate!
    a = addresses[0]
    b = addresses[1]
    matrix[a][b], matrix[b][a] = matrix[b][a], matrix[a][b]
  # matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
  # matrix[1][2], matrix[2][1] = matrix[1][2], matrix[2][1]
  # matrix[2][0], matrix[0][2] = matrix[0][2], matrix[2][0]
  end

  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)


p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]