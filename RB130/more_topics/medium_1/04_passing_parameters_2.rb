array_of_birds = %w(raven finch hawk eagle)

# Method 1: destructuring occurs in the method
def parse_raptors(array)
  x, y, *raptors = array
  yield(raptors)
end

parse_raptors(array_of_birds) do |raptors|
  puts raptors
end

# Method 2: destructuring occurs in the block
def parse_raptors(array)
  yield (array)
end

parse_raptors(array_of_birds) do |x, y, *raptors|
  puts raptors
end