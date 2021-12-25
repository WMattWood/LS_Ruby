require "pry-byebug"

directions = File.foreach('directions').map { |line| line.chomp }

x = 0
y = 0
angle = 0

directions.each do |line|
  value = line.chars.last.to_i
  case line[0] 
  when 'f'
    x += value
    y += value * angle
  when 'u'
    angle -= value
  when 'd'
    angle += value
  end
end

p y * x

# p directions