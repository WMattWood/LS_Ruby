def diamond(num)
  lines = line_maker(num)
  puts walk_up_down(lines)
end

def walk_up_down(collection)
  addresses = []
  0.upto(collection.size - 1) { |index| addresses << collection[index] }
  -2.downto(-collection.size) { |index| addresses << collection[index] }
  addresses
end

def line_maker(num)
  lines = []
  grid_size = num
  1.upto(num) do |current_num|
    if current_num.odd?
      stars = current_num
      blanks = (grid_size - stars) / 2
    else
      next
    end
    lines << (' ' * blanks) + ('*' * stars) + (' ' * blanks)
  end
  lines
end

diamond(20)

# Input: An odd integer
# Output: a diamond image
  # Rules: 
  # - the diamond will be on an odd number n x n grid with the diamond in the center
  # - first line will have 1 star in the center
  # - second line wil have 3 stars in the center
  # - etc. up to the nth number
# Examples: 
# diamond(5)

#   *
#  ***
# *****
#  ***
#   *

# Data structures: arrays
# Algorithm:
  # - populate an array with all unique components of the diamond
    # ___unique component maker method___ 
    # initialize output array
    # cycles through n elements
    # for each odd n, derive '*' and ' ' strings based on total grid size & current num
    # populate output array with formatted string of blanks and stars
    # return output array
  # - walk up and down the array of lines (ie. 1, 2, 3... n ...3, 2, 1 ) and print those values
    # ___walk up down method___
    # initialize an output array
    # iterate through input array from 0 to size -1
    # populate output array with each value
    # iterate through input array from -2 to -size
    # populate output array with each value
    # return output array
  # end
  
    