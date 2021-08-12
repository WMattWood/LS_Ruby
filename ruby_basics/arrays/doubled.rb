number = [1, 2, 3, 4, 5]

doubled_numbers = number.map do |num|
                    num * 2
                  end

# less verbose way
doubled_numbers = numbers.map {|num| num * 2}

p doubled_numbers