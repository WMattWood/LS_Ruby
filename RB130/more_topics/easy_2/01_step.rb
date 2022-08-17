def step (start, stop, step)
  value = start
  output_array = []
  while value <= stop
    output_array << value
    yield(value)
    value += step
  end

  output_array
end

p step(1, 10, 3) { |value| puts "value = #{value}" }