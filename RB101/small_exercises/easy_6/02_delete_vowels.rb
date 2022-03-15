def remove_vowels(array_of_strings)
  array_of_strings.each do |str|
    str.delete!('aeiouAEIOU')
  end
  array_of_strings
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']

# Input: Array of strings
# Output: Array containing same strings