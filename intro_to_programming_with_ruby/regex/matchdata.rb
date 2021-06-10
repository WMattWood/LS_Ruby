# boolean_regex.rb

def has_a_z?(string)
  if /z/.match(string)
    puts "The mark! It has the mark!"
  else
    puts "Begone peasant."
  end 
end 

has_a_z?("zentrix")
has_a_z?("apples")
has_a_z?('bananas')
has_a_z?('doge')