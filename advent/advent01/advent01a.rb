measurements = File.foreach('input').map { |line| line.chomp }
increase_count = 0
decrease_count = 0

measurements.each_with_index do |measure, idx|
  if idx > 0
    increase_count += 1 if measure.to_i > measurements[idx - 1].to_i
  end
end

p increase_count
# p measurements