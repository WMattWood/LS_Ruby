hash = {good: "Red", better: "Yellow", best: "Blue"}

hash.each { |element| puts "Each element using #each: #{element}" }
hash.each_key { |key| puts "Each key using #each_key: #{key}" }
hash.each_value { |value| puts "Each value using #each_value: #{value}" }
hash.each_pair { |pair| puts "Each pair using #each_pair: #{pair}" }

# The Hash method .each is an alias for .each_pair