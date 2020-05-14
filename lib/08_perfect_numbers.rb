# The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.

# Problem
# write a class with on method
# class has no initialize method
#
# class method called classify
#   input: int
#   output: string
#
#   The method checks if the input is a perfect number
#   The output is deficient, perfect or abundat
#
#   What is a perfect number?
#     a number that is the sum of its factors

#   How to do that?
#   Find the divisors
#   add the divisors together and check if its t he number
#   return string
#
#   How to find divisors?
#   start at two and go up to number -1 to find all divisors
#     check each number if mod is 0
#     add that number to an array
#
#   sum up the array and compare with number (case)

# if input is not a positive int raise RuntimeError

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0

    divisors = [1]
    2.upto(number - 1) do |num|
      divisors << num if number.modulo(num).zero?
    end

    if divisors.sum < number
      'deficient'
    elsif divisors.sum == number
      'perfect'
    else
      'abundant'
    end
  end
end
