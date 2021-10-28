flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |each_name|
  each_name[0..2]
end

p flintstones