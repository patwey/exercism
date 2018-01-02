class Series
  def initialize(string)
    @string = string
    @length = string.length
  end

  def slices(size)
    raise ArgumentError unless size <= @length
    idx = 0
    result = []

    while (idx + size) <= @length
      result << @string.slice(idx, size)
      idx += 1
    end

    result
  end
end
