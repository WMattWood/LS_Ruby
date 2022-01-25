# My solution
def ascii_value(str)
  if str.size > 0
    ascii_values = str.chars.map { |char| char.ord }
    ascii_values.reduce(:+)
  else
    0
  end
end

# Launchschool solution using String#each_char (way cleaner!)
def ascii_value2(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0