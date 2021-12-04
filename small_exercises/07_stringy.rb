require 'pry-byebug'

# def stringy(num)
#   output = ""
#   num.times do
#     if output.split.to_a.last == '0' && output.length == 0
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
    binding.pry
    if output.end_with?('1') && output.length > 0
      output << '0'
    else
      output << '1'
    end
  end
  output
end

puts stringy(6) #== '101010'
puts stringy(9) #== '101010101'
puts stringy(4) #== '1010'
puts stringy(7) #== '1010101'