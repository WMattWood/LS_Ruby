def palindrome?(input)
  if input.is_a?(String)
    input == input.chars.reverse.join
  elsif input.is_a?(Array)
    input == input.reverse
  end
end

def real_palindrome?(str)
  valid_chars = ('a'..'z').to_a
  input_letters = str.downcase.chars.select do |char| 
                                              valid_chars.include?(char)
                                            end
  palindrome?(input_letters)                                          
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false