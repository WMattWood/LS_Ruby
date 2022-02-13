require 'pry'

def bubble_sort!(array)
  pairs_cleared = []
 
  loop do

    (array.size - 1).times do
      pairs_cleared <<  false
    end

    0.upto(array.size - 2) do |index|
      if array[index] < array[index + 1]
        pairs_cleared[index] = true
      else
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end

    break if pairs_cleared.all?(true)
  end
  
  array
end




#INPUT: An array of <= 2 elements
#OUTPUT: That same array sorted via bubble sort
  #RULES: The sorting must be performed via bubble sort
#EXAMPLES:
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

#ALGORITHM: Bubble Sort
  # - initialize flag to false
  # - For length of array - 1..
  # - Set flag to true
  # - Compare idx[n] to idx[n+1]
    # - Swap if idx[n+1] > idx[n]
    # - Set flag to false
  # - Break if flag == true