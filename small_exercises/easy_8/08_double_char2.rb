CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  output = ''
  (0...string.size).each do |index|
    if CONSONANTS.include?(string[index].downcase) 
      output << ( string[index] * 2)
    else
      output << string[index]
    end
  end

  output
end



p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""