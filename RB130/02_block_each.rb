def each(array)
  counter = 0

  while counter < array.size
    # on each iteration, passes the array[counter] element in to
    # the block we are yielding to.  This leaves full implementation
    # to the method caller.
    yield(array[counter])
    counter += 1
  end

  # returns the calling object to allow chaining of methods
  array 
end 

each([1, 2, 3, 4, 5]) do |num|
  puts num
end
