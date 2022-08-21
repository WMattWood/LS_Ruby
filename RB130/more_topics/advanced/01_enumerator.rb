my_enumerator = Enumerator.new do |y| ## Enumerator::new
  return 1 if y == 0
  return 1 if y == 1

  counter = 1
  output = 1
  loop do 
    y << output  ## Enumerator#<< (alias for yield)
    output *= counter
    counter += 1
  end

  output
end

puts my_enumerator.take(7) ## Enumerator::take (comes from the Enumerable module)
puts my_enumerator.take(3) ## Enumerator::take (comes from the Enumerable module)