def bubble_sort!(array)
  counter = []
  
  (array.size - 1).times do
    counter << false
  end

  loop do

    (array.size - 1).times do |idx|
      if array[idx] > array[idx+1]
        array[idx], array[idx+1] = array[idx+1], array[idx]
        counter[idx] = false
      else
        counter[idx] = true
      end
    end

    break if counter.all?(true)

  end

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