require 'date'

def friday_13th(year)
  fridays = 0

  1.upto(12) do |month|
    fridays += 1 if Date.new(year, month, 13).friday?
  end
  
  fridays 
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Input: An integer representing a year after 1752
# Output: An integer representing the number of "friday the 13ths" in that year.
  # Rules: 
  # - You gotta count all of the fridays that are also the 13th day of the year
  # - Assume we are using the Gregorian Calendar