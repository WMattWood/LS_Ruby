# the binding of an argument to a method and the method name (p and the return value of array.map) 
# is slightly tighter than the binding between a method call and a do...end block. Thus, array.map 
# gets executed first, then the return value and the block get passed to p as separate arguments.
#
# A {} block, on the other hand, has higher priority which means that it binds more tightly to array.map. 
# Therefore, when we use {}, array.map is called with the block, then the return value of array.map 
# gets passed to p.

array = [1, 2, 3]

p(array.map) do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end                                 #  => <Enumerator: [1, 2, 3]:map>

p(array.map { |num| num + 1 })      # [2, 3, 4]
                                    # => [2, 3, 4]