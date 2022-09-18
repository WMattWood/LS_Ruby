# require 'pry-byebug'

#Input:
# Each object takes a month number (1-12)
# Each object takes a year (e.g., 2021). 

#Output
# Your object can return the exact date of the meeting in the specified month and year. 
# For instance, if you ask for the 'second' Wednesday of May 2021, object returns 12th of May, 2021.

# day method PEDAC
# input: a day of the week, and an nth day specification
# output: a Date class object which corresponds to the correct day 
# Rules:
  # the month and year are pre specified

# Algorithm
  # search through the days of the corresponding month
  # on each iteration, return the .wday method called on the day
  # 

DAY_NUMBER = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
TEENTHS = [13, 14, 15, 16, 17, 18, 19]

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_the_week, nth)
    nth = nth.downcase
    meeting_date = case nth
                   when 'first'
                    search_wdays(day_of_the_week, 1)
                   when 'second' 
                    search_wdays(day_of_the_week, 2)
                   when 'third' 
                    search_wdays(day_of_the_week, 3)
                   when 'fourth' 
                    search_wdays(day_of_the_week, 4)
                   when 'fifth' 
                    search_wdays(day_of_the_week, 5)
                   when 'last' 
                    last_wday(day_of_the_week)
                   when 'teenth'
                    teenth_wday(day_of_the_week)
                   end
    return nil if meeting_date == nil               
    Date.civil(@year, @month, meeting_date)
  end

  def search_wdays(day_of_the_week, number)
    day_of_the_week = DAY_NUMBER.index(day_of_the_week.downcase)
    date = Date.civil(@year, @month)
    count = 0

    loop do
      count += 1 if day_of_the_week == date.wday
      break if count == number
      date = date.next_day
    end

    return nil if date.month != @month
    return date.day
  end

  def last_wday(day_of_the_week)
    day_of_the_week = DAY_NUMBER.index(day_of_the_week.downcase)
    date = Date.civil(@year, @month).next_month.prev_day

    loop do
      break if day_of_the_week == date.wday
      date = date.prev_day
    end

    return date.day
  end

  def teenth_wday(day_of_the_week)
    day_of_the_week = DAY_NUMBER.index(day_of_the_week.downcase)
    date = Date.civil(@year, @month, 13)

    loop do
      break if day_of_the_week == date.wday
      date = date.next_day
    end
    
    return date.day
  end
end