def triangle(n)
  spaces = []
  (n-1).times do spaces << ' ' end
  stars = ['*']

  n.times do
    puts (spaces + stars).join
    spaces.pop
    stars.push('*')
  end

end

triangle(5)


# Input: Integer n
# Output: n strings
  # Rules:
  # - the first line must have n-1 blank spaces followed by 1 star
  # - each successive line must have one less blank space and one more star
  # - the final line must have n stars.

# Example
triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# Data Structures:
  # - Two separate strings that can be manipulated on each iteration

# Algorithm:
  # - Create an arr1 of n-1 blank space characters
  # - Create an arr2 of 1 star character
  # - Create a loop that repeats n times
  # - Print arr1+arr2.join
  # - Pop one char off arr1
  # - Concatenate one star onto arr2
