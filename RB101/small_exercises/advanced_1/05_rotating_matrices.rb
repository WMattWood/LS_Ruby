def rotate90(matrix)
  output_width = matrix.size # the number of arrays in the input matrix
  output_height = matrix[0].size # width of the input matrix
  
  new_matrix = []
  
  output_height.times do
    new_matrix << []
  end

  (output_width - 1).downto(0) do |width|  
    0.upto(output_height - 1) do |height|
      new_matrix[height] << matrix[width][height]
    end
  end

  new_matrix
end


# Input
  # A matrix (array of arrays) of arbitrary size.  However all subarrays will be of same length.
# Output
  # Same array of arrays but rotated 90 degrees.
# Data structure: Nested arrays
# Algorithm
  # Establish dimensions of output array
  # Populate our output matrix with the suitable number of arrays

# EXAMPLES
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2