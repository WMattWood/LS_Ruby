require 'pry-byebug'
class SimpleLinkedList
  # attr_accessor :head
  def initialize
    @head = []
  end

  def size
    @head.size
  end

  def empty?
    @head.empty?
  end

  def push(value)
    @head.push Element.new(value, @head[0])
  end

  def peek
    @head[-1] == nil ? nil : @head[-1].datum
  end

  def head
    @head[-1]
  end

  def pop
    @head.pop.datum
  end

  def self.from_a(arr)
    return self.new unless arr

    new_list = self.new
    arr.each { |item| 
      new_list.push(Element.new(item)) 
      binding.pry 
    }
    new_list
  end
end

class Element
  attr_accessor :value, :next

  def initialize(value, next_value=nil)
    @value = value
    @next = next_value
  end

  def datum
    @value
  end

  def tail?
    @next.nil?
  end

  def next
    @next
  end
end

# bof = Element.new(12)
# p bof.next

SimpleLinkedList.from_a([1, 2, 3, 4])