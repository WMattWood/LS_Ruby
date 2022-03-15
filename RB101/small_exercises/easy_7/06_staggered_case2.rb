def staggered_case(string)
  flag = 'upper'
  words = string.split
  words.each_with_index do |word, index|
    chars = word.chars
    chars.each do |char|
      if char =~ /[A-Za-z]/ && flag == 'upper' 
        flag = 'lower'
        char.upcase!
      elsif char =~ /[A-Za-z]/ && flag == 'lower'
        flag = 'upper'
        char.downcase! if char =~ /[^0-9]/ 
      else
        next
      end
    end

    words[index] = chars.join
  end

  words.join(' ')
end

# Input: A string
# Output: A string with letters alternating between upper and lower case.
  # Rules:
  # - Only letters count in the alternating pattern - skip numbers
  # - The first letter is capitalized
# Examples: 
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
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