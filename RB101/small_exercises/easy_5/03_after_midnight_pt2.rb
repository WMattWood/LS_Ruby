def after_midnight(str)
  hours = str[(0..1)].to_i
  minutes = str[(3..4)].to_i
  hours = 0 if hours == 24
  total_minutes = hours * 60 + minutes
  total_minutes
end

def before_midnight(str)
  hours = str[(0..1)].to_i
  minutes = str[(3..4)].to_i
  hours = 24 if hours == 0
  total_minutes = 1440 - (hours * 60 + minutes)
  total_minutes
end

p after_midnight('12:34') == 754
p after_midnight('00:00') == 0
p after_midnight('24:00') == 0

p before_midnight('12:34') == 686
p before_midnight('00:00') == 0
p before_midnight('24:00') == 0