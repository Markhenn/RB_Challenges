# Reverse evey odd word and echo every even word
# There are only letters, spaces and a terinating point
# a word consists of letters
# an input text ends with a point
# BONUS the character must be read and printed one at a time
#
# Edge cases: no point at end, not allowed characters
#
#
#


def reverse_odd_words(text)
  reverse = false
  pos = -1
  result = ''
  text.chars.each_with_index do |char, idx|
    if char =~ /[a-z]/i && text[idx - 1] =~ / /
      reverse = !reverse
      pos = -1
    end

    if reverse && char =~ /[a-z]/i
      result.insert(pos, char)
      pos -= 1
    else
      result << char
    end
  end
  result
end

puts reverse_odd_words('abc def.') == 'abc fed.'
puts reverse_odd_words('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
puts reverse_odd_words('whats    the matter with kansas .') == 'whats    eht matter htiw kansas .'
