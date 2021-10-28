munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# it works!
munsters.each do |munster, specs|
  age = munsters[munster]['age'] 
  
  case age 
  when 0..17
    munsters[munster]['age_group'] = "kid"
  when 18..64
    munsters[munster]['age_group'] = "adult"
  when 65..nil
    munsters[munster]['age_group'] = "senior"
  end
  
end

# cleaner - the munsters[munster] syntax from above solution is not required to access the values in the specs hash
munsters.each do |munster, specs|
  case specs['age']  
  when 0..17
    specs['age_group'] = "kid"
  when 18..64
    specs['age_group'] = "adult"
  when 65..nil
    specs['age_group'] = "senior"
  end
end

#p munsters
munsters.each {|x| puts x}