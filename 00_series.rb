# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.
#
# Problem
# input is a string
# output is an array with subarrays containing the series
#
# start at the first digit and return an array of the defined length
#   append this to the returning array
# go to next digit and repeat
# do as long until you cant return an array with the length needed
#
# What to do
# - create a class called Series
# - constructor with String
# methods
# - #slices
# - takes one parameter -> size of series
# create custom error messages based on test
#   -> argument erroer when length is bigger than string length
#
# Problem: turn string into series and append to array
# input: string, int
# output: array
#
# parse the string and return digits based length int
#
# Algorithm
# set return array
# set index to zero
# loop
#   set sub arrary
#   from @digits take index to length chars
#   split
#   append to array
#   increment index
#   break when index + length > string length
# return array

class Series
  def initialize(string)
    @digits = string
  end

  def slices(length)
    raise ArgumentError if length > @digits.size
    @digits.chars.map(&:to_i).each_cons(length).to_a
  end
end
