# def stringy(num)
#   output = ""
#   num.times do
#     if output.split('').to_a.last == '0' || output.length == 0
#       output << '1'
#     else
#       output << '0'
#     end
#   end
#   output
# end

def stringy(num)
  output = ""
  num.times do
    if output.end_with?('1') && output.length > 0
      output << '0'
    else
      output << '1'
    end
  end
  output
end

# launch school's much simpler method... use even/odd to do alternating iteration
def stringy2(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'