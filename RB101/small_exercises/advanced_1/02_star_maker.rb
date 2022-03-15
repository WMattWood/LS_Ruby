def star(num)
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
  1.upto(num / 2) do |current_num|
    left_side = Array.new(grid_size / 2, ' ')
    right_side = Array.new(grid_size / 2, ' ')
    left_side[current_num -1] = '*'
    right_side[-current_num] = '*'
    lines << ( left_side.join + '*' + right_side.join )
  end
  middle_of_star = Array.new(grid_size, '*')
  lines << middle_of_star.join
end

star(15)