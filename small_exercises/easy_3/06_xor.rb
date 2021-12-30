def xor(arg1, arg2)
  (arg1 && !arg2) || (arg2 && !arg1) 
end

p xor(true, false)
p xor(false, true)
p xor(true, true)
p xor(false, false)

p xor(1, 2)
p xor(0, 0)
p xor(nil, 2)
p xor(0, false)