def triangle(a, b, c)
  sides = [a, b, c]
  return :invalid if sides.any?(0) 
  return :invalid if sides.sort.last >= sides.sort[0] + sides.sort[1]
  return :equilateral if sides[0] == sides[1] && sides[1] == sides[2]
  return :scalene if sides.uniq.size == 3
  :isosceles
end


# A triangle is classified as follows:

# :equilateral All 3 sides are of equal length
# :isosceles 2 sides are of equal length, while the 3rd is different
# :scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two other sides 
# must be greater than the length of the longest side, and all sides must have 
# lengths greater than 0: if either of these conditions is not satisfied, the 
# triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on 
# whether the triangle is equilateral, isosceles, scalene, or invalid.

# Input: 3 side values (can be int or float)
# Output: one of four symbols (:equilateral, :isosceles, :scalene, :invalid)
  # Rules: 
    # - INVALID if any sides <= 0
    # - INVALID if longest side >= sum of other 2 sides
    # - :equilateral if all 3 sides are of equal length
    # - :scalene if all 3 sides are of different length
    # - :isosceles otherwise
# Example tests:

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# Data structure: i dont know
# Algorithm:

