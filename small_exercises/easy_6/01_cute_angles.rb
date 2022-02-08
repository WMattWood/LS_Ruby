DEGREE = "\xC2\xB0"

def dms(float_num)
  # deriving values
  deg = float_num.floor
  min = ((float_num - float_num.floor) * 60).floor
  sec = ((((float_num - float_num.floor) * 60) - ((float_num - float_num.floor) * 60).floor) * 60).floor
  
  #formatting values
  format(%(#{deg}#{DEGREE}%02d'%02d"), min, sec)
end

p dms(254.6)

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


# Input: a float number
# Output: a string of the format 000°00'00"
# Algorithm:
  # Take input float
  # Round input float down to the nearest whole number 
  # - this becomes degrees value
  
  # Take the input float
  # Subtract the degrees value
  # Multiply the figure by 60 
  # Round down to the nearest whole number 
  # - this becomes the minutes value
  
  # Take the degrees value
  # Subtract the minutes value
  # Multiply the figure by 60
  # Round down to the nearest whole number
  # - this becomes the seconds value

  # Take your three sets of numbers and put them together, (e.g., 121°8'6" longitude would be equivalent to 121.135 degrees longitude).