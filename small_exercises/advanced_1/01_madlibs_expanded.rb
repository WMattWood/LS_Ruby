# Assigning the "words-to-be-swapped-in" to a CONSTANT variable allows the 
# hash (or array) to be accessed from within any layer of the program.
WORD_BASKET = { adjective: %w(quick lazy sleepy ugly moist fantastic),
                noun: %w(fox dog head leg leopard usb-thumb-drive),
                verb: %w(jumps lifts bites licks grinds chomps),
                adverb: %w(easily lazily noisily excitedly greasily sexily),
                the: %w(BONK)
              }

# Using the File.read method, we can pull the contents of a given text file.
input_text = File.read('input.txt')
# Set an output variable to an empty array
output_text = []
# Populate the array with the return value of calling #map on an each of
# the individual words in the provided text.
output_text = input_text.split.map do |word|
                # On each iteration (that is, on each word of the text...)
                # We call the Kernel method #format which accepts a 'match'
                # value (that pipes in any text formatted as %{word}) and
                # a hash value which provides for swapping.  

                # Each value in the hash used below evaluates to a random
                # sampling of the word basket hash's array values... ie.
                # { adjective: %w(quick lazy sleepy ugly moist fantastic) }

                format word, adjective:  WORD_BASKET[:adjective].sample,
                             noun:       WORD_BASKET[:noun].sample,
                             verb:       WORD_BASKET[:verb].sample,
                             adverb:     WORD_BASKET[:adverb].sample,  
                             the:        WORD_BASKET[:the].sample           
              end
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