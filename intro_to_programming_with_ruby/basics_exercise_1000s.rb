def thousands(number)
    number / 1000
end
def hundreds(number)
    number / 100 % 10
end
def tens(number) 
    number / 10 % 10
end
def ones(number) 
    number % 10
end
    
puts thousands(4293)
puts hundreds(4271)
puts tens(3452)
puts ones(1112)