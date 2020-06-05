# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants too.

# Problem:
# a class that translates words into pig latin
# 1 class method called translated with 1 param
#   that param is a string with 1 or more words

# There are certain rules for translation
#   go over rules while translating

# Basic rules:
#   starts with vowel -> add ay
#   starts with 1+ con -> remove consonants and add them + ay
#   y+vowel -> consonant
#   y+consonant -> vowel
#   x+vowel -> consont
#   x+consonant -> vowel
#   qu -> together as consonant

# Data structure
#   Class PigLatin
#     1 class method translate(words)

# Algorithm
#   split words into an array
#   loop over array and change each word
#   join array
#
# How to chane words?
#   check first letters
#   if vowel -> ay
#   if consonant keep checking until vowel -> add con + ay -> delete con
#   if y or x + cons -> treat as vowel

# Basic check with regex
#   check for vowels

class PigLatin
  PIG = 'ay'.freeze

  def self.translate(words)
    words.split.map do |word|
      idx = word =~ /[aeiou]|[xy][^aeiou]/
      idx += 1 if word =~ /qu/

      word[idx..-1] + word[0...idx] + PIG
    end.join(' ')
  end
end
