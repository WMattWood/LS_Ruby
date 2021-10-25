# ALGORITHM (sum_even_num_row)
# 1. Create an empty 'rows' array to contain all of the rows
# 2. Create a 'row' array and add it to the overall 'rows' array
# 3. Repeat step 2 until all the necessary rows have been created
#   - All the rows have been created when the length of the 'rows' array is equal to the input integer
# 4. Sum the final row
# 5. Return the sum of the final row

# Additional logic....
# Calculating the 'start integer':
# Rule: First integer of row == last integer of preceding row + 2
# Algorithm:
# - get the last row of the rows array
# - get the last integer of that row
# - add two to that integer

# 1st solution
def sum_even_num_row(row_number)
  # initialize 'rows' array and starting values for create_row method
  rows = []
  row_length = 1
  start_integer = 2
    #steps 2 & 3 - looped
    loop do 
      #call the create_row method and pass it initial values
      rows << create_row(start_integer, row_length)
      #increment values
      row_length += 1
      start_integer = rows.last.last + 2
      #exit loop once the row length is equal to row_number argument
      break if rows.length == row_number
    end
  # return the sum of the final row in array 'rows'
  rows.last.sum #to do: sum the final row
end

# 2nd Solution
def sum_even_num_row_each(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number| 
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum #to do: sum the final row
end

# ALGORITHM (create_row):
# 1. Create an empty 'row' array to contain the integers
# 2. Add the starting integer to the 'row' array
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 & 3 until the array has reached the correct length.
# 5. Return the 'row' array

def create_row(start_integer, row_length)
  #create empty 'row' array
  row = []
  current_integer = start_integer
    #steps 2-3
    #repeat steps 2-3 ...use a loop
    loop do
      #add starting integer to the row array
      row << current_integer
      #increment starting integer by 2 to get next integer in sequence
      current_integer += 2
      #break once the 'row' array has reached the correct length
      break if row.length == row_length
    end
  #return row
  row
end

# TEST CASES
# row number: 1 --> sum is 2
# row number: 2 --> sum is 10
# row number: 4 --> sum is 68

p sum_even_num_row(1) == 2  #true
p sum_even_num_row(2) == 10 #true
p sum_even_num_row(4) == 68 #true

p sum_even_num_row_each(1) == 2  #true
p sum_even_num_row_each(2) == 10 #true
p sum_even_num_row_each(4) == 68 #true

# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: 3 --> [8, 10, 12]

p create_row(2, 1) == [2]         #true
p create_row(4, 2) == [4, 6]      #true
p create_row(8, 3) == [8, 10, 12] #true