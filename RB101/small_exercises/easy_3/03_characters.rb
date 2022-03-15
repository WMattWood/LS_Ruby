def prompt(msg)
  puts "==> #{msg}"
end

prompt "Please write word or multiple words:"
answer = gets.chomp

letters = answer.chars.select { |letter| letter != ' '}

prompt "There are #{letters.size} characters in '#{answer}'."