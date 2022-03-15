def prompt(msg)
  puts ">> #{msg}"
end

loop do
  operation = ''
  num = 0
  
  loop do
    prompt "Please enter an integer greater than 0:"
    num = gets.chomp.to_i
    break if num > 0 && num.is_a?(Integer)
    prompt "Invalid entry, please try again."
  end
  
  loop do
    prompt "Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp.downcase
    break if operation == 's' || operation == 'p'
    prompt "Invalid entry, please try again."
  end
  
  case operation
  when 's'
    result = (1..num).reduce(:+)
    prompt "The sum of the integers between 1 and #{num} is #{result}."
  when 'p'
    result = (1..num).reduce(:*)
    prompt "The product of the integers between 1 and #{num} is #{result}."
  end
  
  prompt "Compute again? (Y/N)"
  quit_prompt = gets.chomp
  break unless quit_prompt.downcase == 'y'
  
end