# Using the File.read method, we can pull the contents of a given text file.
input_text = File.read('input.txt')

# Splits the text into words, and then formats any word with a %{ } 'format specifier'
# by assigning it to the value of a corresponding hash.  Interestingly, if we defined 
# this hash outside of the #map method's code block, the hash would be defined
# only ONCE, which would mean that the result of the #sample method being called on the
# various arrays would be evaluated only once as well. This leads to the array of words
# being collapsed to a single word.  The code still works, but you wind up with the 
# same adjective, noun, etc. being repeated on every %{ } instance in the input text.
# Defining the hash inside of the map method's code block allows #sample to be called
# uniquely on each iteration.
output_text = input_text.split.map do |word|
                format word, adjective: %w(quick lazy sleepy ugly moist fantastic).sample,
                             noun: %w(fox dog head leg leopard usb-thumb-drive).sample,
                             verb: %w(jumps lifts bites licks grinds chomps).sample,
                             adverb: %w(easily lazily noisily excitedly greasily sexily).sample         
              end

# Returns the formatted array joined back together in a sentence.
puts output_text.join(' ')


# Input: A pre-built text file
# Output: A reconstruction of the text file with keywords swapped out for a random assortment
# Examples:

# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

# Data Structures:  I think I will use a hash to store the various swap words