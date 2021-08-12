words = 'car human elephant airplane'
plurals = words.split

plurals.each do |word|
  puts word + 's'
end

# more efficient way
words.split.each do |word|
  puts word + 'z'
end