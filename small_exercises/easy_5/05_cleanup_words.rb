def cleanup(str)
  letters = ('A'..'z')
  output = ""
  str = str.chars 
  str.each do |char|
    if letters.include?(char)
      output << char
    elsif output[-1] != ' '
      output << ' '
    end
  end
    
  output
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("what's my +*& line?") == 'what s my line '

# Input: String
# Output: String with non-alphabetic characters removed

# Define a range of all alphabetic characters
# Initialize an empty output string
# Convert the string to an array of characters
# Iterate through each character in the array, and check if the character appears in the range of alphabetic characters
  # If the character is included in the alphabetic range, concatenate it to the output string
  # Check if the last character in the output string [-1] is a blank space ' '.  If so, go to the next iteration.
    # If last char is not a blank space, and char is not included in the alphabetic range, concatenate a blank space ' ' to the output string
# Return output string