def staggered_case(string)
  flag = 'upper'
  string.chars.each do |char|
    if flag == 'upper'
      flag = 'lower'
      char.upcase! if char =~ /[^0-9]/
    elsif flag == 'lower'
      flag = 'upper'
      char.downcase! if char =~ /[^0-9]/ 
    end
  end

  chars.join
end

# Input: A string
# Output: A string with letters alternating between upper and lower case.
  # Rules:
  # - Only letters count in the alternating pattern - skip numbers
  # - The first letter is capitalized
# Examples: 
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# Data Structure: Split the string into an array of words, and work with that array.
# Algorithm:
  # - Set a flag for which round we are on (uppercase or lowercase)
  # - Split the string into an array of words
  # - Iterate through each word
  # - Iterate through each character of each word
  # - If the char is a letter, and the flag is upper, uppercase the character.
    # - Set the flag to lower
  # - If the char is a letter, and the flag is lower, lowercase the character.
    # - Set the flag to upper
  # - If the char is not a letter, skip
  # - Return the joined words array