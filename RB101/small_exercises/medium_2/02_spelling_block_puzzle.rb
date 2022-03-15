BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)


def block_word?(string)
  string = string.upcase.chars
  BLOCKS.none? do |pair|
    string.include?(pair[0]) && string.include?(pair[1])
  end
end


p block_word?('BATCH') == true
p block_word?('BaTcH') == true
p block_word?('BUTCH') == false
p block_word?('BOTCH') == false
p block_word?('botch') == false
p block_word?('bOtch') == false
p block_word?('BoTCH') == false
p block_word?('jest') == true

# Input: A string
# Output: a boolean that says whether the input string can be constructed using
# each of the spelling block pairs defined in the spelling blocks hash
  # Rules: 
  # - Each letter in the string must not have a paired letter which also appears 
  # in the string.


# Algorithm 1:
  # Split string into characters
  # Iterate through characters, for each character...
    # - check if the character exists as a key in the spelling_blocks hash.
      # - if yes, check if that key's value appears in the spelling blocks hash.
        # - if yes, return false
        # - if no, continue
    # - check if the character exists as a value in the spelling_blocks hash.
      # - if yes, check if that value's key appears in the spelling blocks hash.
        # - if yes, return false
        # - if no, continue

# Algorithm 2:
  # Iterate over the spelling blocks hash
  # For each pair, if both are present in the string return false
  # Otherwise return true