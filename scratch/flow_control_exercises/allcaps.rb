def all_caps_if_10(argument)
    if argument.length > 10
        argument.upcase
    else
        argument
    end 
end 

puts all_caps_if_10("What is up my friends?")
puts all_caps_if_10("should not")