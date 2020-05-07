# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

# Test suite:
#
# Problem
# 3 methods
# initialize
# self.to()
# to
# when no object instantiated use 3 and 5 for multipliers
# when object instantiated, use the number from contructor
#
# Here is the Problem, I just want to write the algorithm one time and both
# version should use the same one.
#
# Basic Algorithm
#  call with object on numbers
#  call number upto end number / number
#    append each number to the new object
#
#  call flatten on return value
#  then call sum on it

class SumOfMultiples
  BASE_NUM = [3, 5]

  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(numbers = BASE_NUM, end_num)
    (1...end_num).select do |multiple|
      numbers.any? { |num| multiple.modulo(num).zero? }
    end.sum
  end

  def to(end_num)
    self.class.to(@numbers, end_num)
  end
end
