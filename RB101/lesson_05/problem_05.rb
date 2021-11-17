# Find out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age = 0

munsters.each do |member, _ |  # IMPORTANT NOTE: If you want to access key and value of hash, use 2 args
  # p member
  if munsters[member]["gender"] == 'male'
    age += munsters[member]["age"]
  end
end

p age