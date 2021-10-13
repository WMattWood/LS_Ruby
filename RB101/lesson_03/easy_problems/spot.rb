ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?("spot")

# could also use...
ages.key?("Spot")

# or could also use...
ages.member?("Spot")