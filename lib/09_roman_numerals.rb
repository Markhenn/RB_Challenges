# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).

#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

# Problem:
# turn decimal numbers in roman numerals
# input: number
# output: string
# 1 -> I
# 2 -> II
# 5 -> V
#
# cut the number up into its digits
# transform each digit
# join together to a string

# Algorithm
# create a hash with the numerals
# turn the int into a string
# split the string
# reverse array
# map each number to a numeral
# reverse again
# join string

# add the to_roman instance method to Integer
module RomanNumerals
  NUMERALS = {
    1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC',
    50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
  }

  def to_roman
    remainder = self

    NUMERALS.keys.reduce('') do |roman_numeral, decimal|
      quotient, remainder = remainder.divmod(decimal)
      roman_numeral << NUMERALS[decimal] * quotient
    end
  end
end

Integer.include(RomanNumerals)

class Integer
  NUMERALS = {
    0 => { 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX' },
    1 => { 1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL', 5 => 'L', 6 => 'LX', 7 => 'LXX', 8 => 'LXXX', 9 => 'XC' },
    2 => { 1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD', 5 => 'D', 6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM' },
    3 => { 1 => 'M', 2 => 'MM', 3 => 'MMM' }
  }

  def to_roman2
    self.digits.map.with_index { |n, i| NUMERALS[i][n] }.reverse.join
  end
end

