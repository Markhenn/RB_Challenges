# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# Problem
# count the words in a string
#
# How to do that
# split the string into words
# create an empty hash with default of zero
# iterate over words
#   add the word to hash and add +1 to counter

class Phrase
  def initialize(string)
    @phrase = string
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word.downcase] += 1
    end
  end

  def words
    @phrase.gsub(/'(\w+)'/, '\1').scan(/\w+'?\w*/)
  end
end
