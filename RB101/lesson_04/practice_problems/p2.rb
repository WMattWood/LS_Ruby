ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_total = 0

ages.each do |key, value|
  ages_total += value
end

p ages_total