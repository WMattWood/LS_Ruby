def triangle(a, b, c)
  angles = [a, b, c]
  return :invalid if angles.any?(0) 
  return :invalid if angles.sum != 180
  return :right if angles.any?(90)
  return :acute if angles.all? { |angles| angles < 90 }
  :obtuse
end


# :right One angle of the triangle is a right angle (90 degrees)
# :acute All 3 angles of the triangle are less than 90 degrees
# :obtuse One angle is greater than 90 degrees.


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid