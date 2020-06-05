# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

# After you've come up with a solution that can pass the tests, try a bonus solution with the restriction that there can't be any conditionals (if or case statements) in your code.

# Problem
# recreate the song
# instance method #verse
# input: integer
# output: string

# #verses
# input, integers
# output: string

# #lyrics
# input: none
# output: String

# Generell ideas
# lines 99 to 2 are the same words jsut different numbers
# lines 1 and 0 have different wordings
# There is a new line \n between each line

# Create #verses
# def parameter as * to get an array
# iterate over array
#   append return of calling verse with line to result
#   append an extra "\n" to result
# return result


class BeerSong
  END_VERSES = {
    0 =>  "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    1 =>  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n",
    2 =>  "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  }

  def verse(line)
    END_VERSES[line] || default_verse(line)
  end

  def verses(start, ending)
    start.downto(ending).reduce('') do |song, line_num|
      song + verse(line_num) + "\n"
    end.chomp
  end

  def lyrics
    verses(99, 0)
  end

  private

  def default_verse(line)
    "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
      "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
  end

end

class BeerSong2
  def verse(line)
    case line
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
        "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
    end
  end

  def verses(start, ending)
    start.downto(ending).reduce('') do |song, line_num|
      song +=  verse(line_num)
      song += "\n" unless line_num == ending
      song
    end
  end

  def lyrics
    verses(99, 0)
  end
end
