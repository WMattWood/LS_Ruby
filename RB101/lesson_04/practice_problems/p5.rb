flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# using each_with_index
answer = ""
flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    answer = index
  end
end
p answer

# using .index with a code block
p flintstones.index { |name| name[0, 2] == "Be" }
p flintstones.index { |name| name.start_with?("Be") }