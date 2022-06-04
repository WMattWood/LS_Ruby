def decrease(counter)
  counter -= 1
  counter
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'