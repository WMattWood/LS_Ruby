# this method takes a number argument, and will yield to a block
# because we don't define what happens inside the while loop, this
# detail is left up to the method caller - they can decide what to
# do with the counter.

def times(number)
  counter = 0
  while counter < number do
    yield (counter)
    counter +=1
  end

  number
end

# at execution, the block is passed in to the #times method at the
# spot where the keyword yield is used, and the counter value is
# passed in as the argument to the block.

times(5) do |num|
  puts num
end