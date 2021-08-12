name = 'Roger'
other_name = "RoGeR"

puts name == other_name
puts name.downcase == other_name.downcase

# it is also possible to use the #casecmp() method
# #casecmp() returns '0' for a match and '-1' for a non match

puts name.casecmp('RogeR') == 0