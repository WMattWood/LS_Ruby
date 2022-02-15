ALPHABET = ('A'..'z')

def flip_letters(string)
  input_array = string.chars
  output_array = string.chars
  indexes = []
  chars = []

  input_array.each_with_index do |char, index|
    if ALPHABET.include?(char)
      indexes << index
      chars << char
    end
  end

  indexes.reverse!

  chars.each_with_index do |char, index|
    output_array[indexes[index]] = char
  end

  output_array.join

end


p flip_letters('ab69c')
