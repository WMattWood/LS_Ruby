numbers = {
  high:   100,
  medium: 50,
  low:    10
}

# my solution
half_numbers = numbers.map {|key, value| value / 2}
p half_numbers

# alternate solution #1
half_numbers = numbers.values.map {|value| value / 2}
p half_numbers

# alternate solution #2
half_number = numbers.values.map do |value|
                value / 2
              end
p half_number