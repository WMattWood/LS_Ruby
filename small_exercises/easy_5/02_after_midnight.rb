def time_of_day(signed_int)
  hours, minutes = signed_int.divmod(60)
  # hours %= 24 if hours >= 24 || hours <= -24
  # hours += 24 if hours < 0
  hours %= 24
  format_time(hours, minutes)
end

def format_time(hours, minutes)
  "#{"%02d" % hours}:#{"%02d" % minutes}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"