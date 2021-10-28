ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# using iteration through the hash
ages.each do |key, value|
  ages.delete(key) if value > 100
end

# modifying hash directly
ages.delete_if { |key, value| value > 100 }

p ages