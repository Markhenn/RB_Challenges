# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)

# Problem
# this could just be method but I need a class
# input: int
# output array of numbers

# Take the in turn it into range -> array
# iterate over array
# slice array to start after the current index for next operation
# use delete at on array when mod current number is 0 and current number is not
# number
# break once the current * 2 is equal bigger to end of range
#

class Sieve
  def initialize(final_number)
    @final_number = final_number
    @number_array = (2..final_number).to_a
  end

  def primes
    @number_array.each do |prime|
      @number_array.reject! { |num| num != prime && num.modulo(prime).zero? }
    end
  end

  def primes1
    index = 1
    while @number_array[index - 1] * 2 < @final_number do
      base_number = @number_array[index - 1]
      @number_array.delete_if do |number|
        next if number <= base_number
        number.modulo(base_number).zero?
      end
      index += 1
    end
    @number_array
  end
end


