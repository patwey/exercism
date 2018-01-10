class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    return TrinaryDigit::DEFAULT_VALUE unless valid?
    digits.map(&:decimal_value).reduce(:+)
  end

  def valid?
    symbols.all?(&:valid?)
  end

  private

  attr_reader :trinary_string

  def digits
    @digits ||= symbols.reverse.each_with_index.map { |symbol, position| TrinaryDigit.new(symbol, position) }
  end

  def symbols
    @symbols ||= trinary_string.chars.map { |char| TrinarySymbol.new(char) }
  end
end

class TrinaryDigit
  DEFAULT_VALUE = 0

  attr_reader :symbol, :position

  def initialize(symbol, position)
    @symbol = symbol
    @position = position
  end

  def decimal_value
    return DEFAULT_VALUE unless valid_symbol?
    symbol.to_i * (3 ** position)
  end

  def valid_symbol?
    symbol.valid?
  end
end

class TrinarySymbol
  VALID_SYMBOLS = %w(0 1 2)

  def initialize(symbol)
    @symbol = symbol
  end

  def valid?
    VALID_SYMBOLS.include?(symbol)
  end

  def to_i
    symbol.to_i
  end

  private

  attr_reader :symbol
end

module BookKeeping
  VERSION = 1
end
