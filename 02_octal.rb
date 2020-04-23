class Octal
  BASE = 8
  INVALID_OCTAL = /\A[0-7]+\z/
  def initialize(string)
    @octal_string = string
  end

  def to_decimal
    return 0 unless @octal_string =~ INVALID_OCTAL
    @octal_string.chars.reverse.map.with_index { |n, i| n.to_i * BASE ** i }.sum
  end
end
