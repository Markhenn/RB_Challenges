# Typically meetups happen on the same day of the week.

# Examples are

# the first Monday
# the third Tuesday
# the Wednesteenth
# the last Thursday
# Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.

# Write code that calculates date of meetups.

# Problem
# Take a year, month, week day and a schedule and turn it into the proper date

# how to calculate the date from the input?
# May 2013
# check for the weedkday first
# then apply a multiple of days to find the proper date
# for first

# check if the first day matches the weekday
#   yes -> return that date
#   no -> add 1 day check again
# no dates need to be added

# check for teenth
#  add 12 days and check if the weekday matches
#
# check for second, third, fourth
#  add 7 to days
#  add 14
#  add 21
#
# for last
# try to add 28 and check if this a proper date,
# if not call try with fourth

# create different methods for first, second, third, fourth, last, teenth

# Test cases and Data Source are given
#
# Algorithm:
# create a date object from month and year
# add 1 day until you hit the weekday
# case the schedule
#   call the proper method passing in the weekday
#

# Date.new(2001).step(Date.new(2001,-1,-1)).select{|d| d.sunday?}.size

require 'date'

class Meetup
  def initialize(month, year)
    @first_day = Date.new(year, month)
    @last_day = Date.new(year, month, -1)
  end

  def day(weekday, schedule)
    days = @first_day.upto(@last_day).select do |day|
      Date::DAYNAMES[day.wday].downcase.to_sym == weekday
    end
    select_by_schedule(days, schedule)
  end

  private

  def select_by_schedule(days, schedule)
    case schedule
    when :first then days.first
    when :second then days[1]
    when :third then days[2]
    when :fourth then days[3]
    when :last then days.last
    else
      (13..19).cover?(days[1].day) ? days[1] : days[2]
    end
  end
end

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @schedule_start_day = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
  end

  def day(weekday, schedule)
    first_day = Date.civil(@year, @month, @schedule_start_day[schedule])
    (first_day..(first_day + 6)).detect {|day| day.public_send(weekday.to_s + '?')}
  end
end
