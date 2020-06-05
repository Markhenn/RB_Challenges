# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values
# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Examples
# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E
# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

# Problem
# compute a score based on letters
# Inputs: word
# Output: integer
#
# make case insensitive
#
# empty string, white space string, nil all go nil
#
# How to solve:
# map each char to the points 
# sum for word
#
# create a look up hash to look up each char

class Scrabble
  SCORES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word || ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 unless chars_in_word_valid?
    @word.chars.map { |char| SCORES[get_hash_key(char)] }.sum
  end

  private

  def chars_in_word_valid?
    @word.chars.all? { |char| SCORES.keys.flatten.include?(char.upcase) }
  end

  def get_hash_key(char)
    SCORES.keys.select { |array| array.include?(char.upcase) }.flatten
  end
end
