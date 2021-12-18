require 'pry-byebug'

measurements = File.foreach('input').map { |line| line.chomp.to_i }
increase_count = 0
sample1 = []
sample2 = []

measurements.each_with_index do |measure, current_index|
  if current_index < measurements.length - 3 
    window_end = current_index + 2
    sample1 = measurements[(current_index..window_end)]
    sample2 = measurements[(current_index + 1..window_end + 1)]
    increase_count += 1 if sample2.reduce(:+) > sample1.reduce(:+)
  end
end

p increase_count