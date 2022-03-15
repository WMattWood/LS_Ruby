def transpose(matrix)
  height = matrix[0].size # width of the matrix
  width = matrix.size # the number of arrays in the matrix

  new_matrix = []
  
  height.times do
    new_matrix << []
  end

  0.upto(width - 1) do |row_index|
    0.upto(height - 1) do |column_index|
      new_matrix[column_index] << matrix[row_index][column_index]
    end
  end

  new_matrix
end



p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


# algo
# define the dimensions of the output matrix 
  # find the height and width parameters
# for the value of width times, 
  # do the value of height times the following:
    # take index of 