def century(year)
  year += 99 
  year = year.to_s
  year.slice!(-2..-1)
  if year[-2] != '1'
    case year[-1]
    when '1'
      year + "st"
    when '2'
      year + "nd"
    when '3'
      year + "rd"
    else
      year + "th"
    end
  else
    year + "th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'