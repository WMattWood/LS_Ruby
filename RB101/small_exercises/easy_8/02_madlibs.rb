def prompt(msg)
  puts "=> #{msg}"
end

puts "### Welcome to Mad Libs ###"
prompt "Please enter a noun: "
noun = gets.chomp
prompt "Please enter a verb: "
verb = gets.chomp
prompt "Please enter a adjective: "
adjective = gets.chomp
prompt "Please enter a adverb: "
adverb = gets.chomp

prompt "...calculating your Madlib..."
puts "Please #{adverb} #{verb} my #{adjective} #{noun}."