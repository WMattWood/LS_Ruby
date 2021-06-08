breakfast_hash = {eggs: 2, potatoes: 1, green_peppers: 1, red_peppers: 1, garlic: 3, pepper: "some", salt: "some"}

breakfast_hash.keys.to_a.each {|key| puts key}
breakfast_hash.values.to_a.each {|value| puts value}
breakfast_hash.to_a.each {|key, value| puts "#{key}: #{value}"}