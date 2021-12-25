require "pry-byebug"

directions = File.foreach('directions').map { |line| line.chomp }

distance = 0
depth = 0

directions.each do |line|
  case line[0] 
  when 'f'
    distance +=  line.chars.last.to_i
  when 'u'
    depth -=  line.chars.last.to_i
  when 'd'
    depth +=  line.chars.last.to_i
  end
end

p depth * distance

# p directions