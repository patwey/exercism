class RunLengthEncoding
  ALPHA_AND_WHITESPACE = /[a-zA-Z\s]/

  def self.encode(string)
    return '' if string == ''
    index = 0
    count = 0
    char = string[index]
    while string[index] == char
      count += 1
      index += 1
    end
    encoded = count > 1 ? char.prepend(count.to_s) : char
    encoded + encode(string[index..-1])
  end

  def self.decode(string)
    repeat = ''
    decoded = ''
    string.split('').each do |char|
      if char =~ ALPHA_AND_WHITESPACE
        repeat = repeat.to_i > 0 ? repeat.to_i : 1
        decoded << char * repeat
        repeat = ''
      else
        repeat << char
      end
    end
    decoded
  end
end

module BookKeeping
  VERSION = 3
end
