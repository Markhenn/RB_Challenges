# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.
# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
# The program should consider strings specifying an invalid binary as the value 0.

# Problem
# write a program that converts a number into a series of commands
# input: int or string with binary code
# output" array with command strings
#
# edge case
#   a non binary string becomes just 0 -> empty array

# how to solve this
# commands method
#   @binary is a binary string

#   set empty array
#   iterate over each digit in reverse and with index
#     if last pos index reverse array and break
#     if element is 1 -> append element at index to result array
#
#   return result

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(input)
    @binary = turn_into_binary(input)
  end

  def commands
    @binary.reverse.chars.each_with_index.with_object([]) do |(bin, idx), seq|
      break seq.reverse! if idx == COMMANDS.size
      seq << COMMANDS[idx] if bin == '1'
    end
  end

  private

  def turn_into_binary(input)
    return input.to_s(2) if input.is_a?(Integer)
    return input unless input =~ /[^01]/
    '0'
  end
end

