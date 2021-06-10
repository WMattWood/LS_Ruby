# next_loop.rb

i = 0
loop do
    i += 2
    if i == 4
        next     # if the iterator(i) matches 4 then the 'next' keyword is invoked which skips the current iteration and proceeds to next step
    end 
    puts i
    if i == 10
        break
    end 
end