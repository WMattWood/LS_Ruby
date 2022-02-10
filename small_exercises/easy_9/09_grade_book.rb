def get_grade(g1, g2, g3)
  grade_average = (g1 + g2 + g3) / 3
  
  case grade_average 
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# Input: Three integer arguments
# Ouput: One letter string
# Rules: 
  # - you must average the three integers
  # - the letter returned will be decided on the range the average falls into
  # - see chart for number -> grade conversions
# Examples:
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
# Data Structure: Not a data structure, but i will probably use a case/switch statement
# Algorithm:
  # - grade_average is assigned to the value of arguments summed and divided by 3
  # - a case statement returns a letter based on the value of grade_average