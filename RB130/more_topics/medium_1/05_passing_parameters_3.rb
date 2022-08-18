items = %w(apples corn cabbage wheat)

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *first_elements, last_element |
  puts first_elements.join(', ')
  puts last_element
end

gather(items) do | first_element, *middle_elements, last_element |
  puts first_element
  puts middle_elements.join(', ')
  puts last_element
end

gather(items) do | first_element, *last_elements |
  puts first_element
  puts last_elements.join(', ')
end

gather (items) do | first, second, third, fourth |
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end