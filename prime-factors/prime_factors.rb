class PrimeFactors
  def self.for(number)
    divisor = 2
    factors = []

    while number > 1
      if number % divisor == 0
        number = number / divisor
        factors << divisor
      else
        divisor += 1
      end
    end

    factors
  end
end
