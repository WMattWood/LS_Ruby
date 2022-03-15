def buy_fruit(grocery_list)
  output = []
  grocery_list.each do |item|
    item[1].times { output << item[0] }
  end
  output
end

# Input: Nested array - each sub array contains a string and an integer
# Output: A one-dimensional array containing each string repeated the 
# number of times indicated by the integer value.
# Rules: 
  # - ['string', number] 'string' must be repeated 'number' of times
# Examples:
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]
# Data Structure: Arrays
# Algorithm: 
  # - initialize output array
  # - iterate through grocery list
    # - for each item, << the string into the array idx[1].times
  # - return the array
