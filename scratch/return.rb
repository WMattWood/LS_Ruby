def add_three(number)
    return number + 3
    number + 4                      # this line does not return because we have already escaped with the previous line
end 

returned_value = add_three(4)
puts returned_value