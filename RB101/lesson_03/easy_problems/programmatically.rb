# using the .include? method
puts (10..100).include?(42)

# using the .cover? method
puts (10..100).cover?(42)

# using a code block (programmatically?)
state = false
range = (10..100)
range.each do |num|
  if num == 42
    state = true
  end
end
puts state

