def time_of_day(boolean)
  if boolean == true
    puts "It's daytime!"
  else
    puts "It's night time!"
  end
end

daylight = [true, false].sample
time_of_day(daylight)