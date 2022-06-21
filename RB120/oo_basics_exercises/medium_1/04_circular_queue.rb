class CircularQueue
  def initialize(size)
    @queue = Array.new(size) # A new Array object instantiated this way contains only nil values.
    @write_position = 0 # Upon writing, the value at the indicated index is overwritten
    @read_position = 0 # Upon reading, the value at the indicated index is set to nil.
  end
  
  def enqueue(item) # The write operation

    # if the current write position contains a non-nil value, then the read position is set
    # to the next slot after the current write position
    if queue[write_position] != nil
      self.read_position = increment_position(write_position)
    end

    queue[write_position] = item
    self.write_position = increment_position(write_position)
  end

  def dequeue # The read operation
    value = queue[read_position]
    queue[read_position] = nil
    self.read_position = increment_position(read_position) unless value == nil
    value
  end

  private

  attr_accessor :write_position, :read_position
  attr_reader :queue

  def increment_position(index)
    (index + 1) % queue.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil