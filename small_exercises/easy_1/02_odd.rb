def is_odd?(num)
  num % 2 == 1
end

p is_odd?(-1)
p is_odd?(-4)
p is_odd?(0)
p is_odd?(3)



def is_odder?(num)
  num.abs.remainder(2) == 1
end 

p is_odder?(-1)
p is_odder?(-4)
p is_odder?(0)
p is_odder?(3)
