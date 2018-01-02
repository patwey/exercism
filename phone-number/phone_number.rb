class PhoneNumber
  NON_DIGITS = /[\D]/

  def self.clean(number)
    number = number.gsub(NON_DIGITS_OR_WHITESPACE, '')
    number = strip_country_code(number)
    number if valid_area_code?(number) && valid_exchange_code?(number)
  end

  private_class_method :strip_country_code, :valid_area_code?,
                       :valid_exchange_code?, :area_code, :exchange_code

  def self.strip_country_code(number)
    return number unless number.length == 11 && number[0] == '1'
    number[1..-1]
  end

  def self.valid_area_code?(number)
    return false unless number.length == 10
    ('2'..'9').cover?(area_code(number)[0])
  end

  def self.valid_exchange_code?(number)
    return false unless number.length == 10
    ('2'..'9').cover?(exchange_code(number)[0])
  end

  def self.area_code(number)
    return unless number.length == 10
    number[0..2]
  end

  def self.exchange_code(number)
    return unless number.length == 10
    number[3..5]
  end
end

module BookKeeping
  VERSION = 2
end
