# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

# Problem
# choose the fitting anagrams from a list
# input initialize: string
# input match: array of word
# output: array of words

# choose from the list the ones that are anagrams
# 1. how to check for anagrams
#  - sort the original word as an array
#  - iterate over each anagram with select
#       sort the anagram
#       compare to word




class Anagram
  def initialize(string)
    @word = string.downcase
  end

  def match(anagram_list)
    word_sorted = @word.chars.sort
    anagram_list.select do |anagram|
      anagram.downcase != @word &&
      word_sorted == anagram.downcase.chars.sort
    end
  end
end

