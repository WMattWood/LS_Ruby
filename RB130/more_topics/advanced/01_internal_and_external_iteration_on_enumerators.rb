my_enumerator = Enumerator.new do |yielder| ## Enumerator::new
  counter = 1
  output = 1
  loop do 
    yielder << output  ## Enumerator#<< (alias for yield)
    output *= counter
    counter += 1
  end

  output
end

### Testing Functionality ###
# puts my_enumerator.take(7) ## Enumerator::take (comes from the Enumerable module)
# puts my_enumerator.take(3) ## Enumerator::take (comes from the Enumerable module)


# External iterators
puts "First call"
6.times { |number| puts "#{number}! == #{my_enumerator.next}" }
puts "=========================="
puts "Second call"
6.times { |number| puts "#{number}! == #{my_enumerator.next}" }
puts "=========================="
puts "Third call after calling #rewind"
my_enumerator.rewind
6.times { |number| puts "#{number}! == #{my_enumerator.next}" }
puts "=========================="


# Internal iterators
# No #rewind call is required because it's called under the hood with internal iterators."
puts "Fourth call using an internal iterator - no rewind call required."
puts "(happens under the hood)"
my_enumerator.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end

6.times puts my_enumerator(1)