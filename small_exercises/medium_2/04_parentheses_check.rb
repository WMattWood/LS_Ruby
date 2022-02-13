def balanced?(string)
  brackets = string.chars.select { |char| char.match? /\(|\)/ }
  return false if brackets.last == '(' || brackets.first == ')'
  brackets.count('(') == brackets.count(')')
end 

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Input: string
# Output: boolean test for presence of paired '(' ')' brackets
  # Rules:
  # - Return false if there is a '(' or ')' missing its corresponding pair
  # - Order matters! Corresponding pair means that one '(' must come before ')'
# Algorithm2:
  # - populate an array brackets with all occurences of '(' and ')'
  # - return false if the first item in brackets array is a ')' or if the
  #   last item in brackets array is a '('
  # - return true if count of '(' and ')' in brackets array are equal 



  # Algorithm1 WRONG - NEEDS TO MATCH ORDER!!:
  # split input string into chars
  # - if count of '(' and ')' are equal return true