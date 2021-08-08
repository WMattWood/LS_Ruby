say_hello = true
i = 0

while say_hello
  puts 'Hello!'
  i += 1
  if (i == 5)
    say_hello = false
  end
end