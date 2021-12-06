def count_occurrences(input_array)
  if input_array.class == Array
    output_list = {}
    input_array.each do |item|
      if output_list.has_key?(item)
        output_list[item] += 1
      else
        output_list[item] = 1
      end
    end
    output_list.each { |k, v| puts "#{k} => #{v}" }
  else
    "invalid argument: count_occurrences expects an array as input"
  end
end

# launch school version

def count_occurrences2(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

### TEST CASE ###

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
count_occurrences2(vehicles)