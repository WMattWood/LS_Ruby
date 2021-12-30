def palindromic_number?(input)
  if input.is_a?(String)
    input == input.chars.reverse.join
  elsif input.is_a?(Array)
    input == input.reverse
  elsif input.is_a?(Integer)
    input.to_s == input.to_s.chars.reverse.join 
  end
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(005) == true