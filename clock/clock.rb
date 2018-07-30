class Clock
  def self.at(hours, minutes)
    ClockTime.new(hours * 60 + minutes)
  end
end

class ClockTime
  attr_reader :total_minutes

  def initialize(total_minutes)
    @total_minutes = total_minutes
  end

  def to_s
    "#{zero_padded_hours}:#{zero_padded_minutes}"
  end

  def +(minutes)
    @total_minutes += minutes
    self
  end

  def ==(clock_time)
    hours == clock_time.hours && minutes == clock_time.minutes
  end

  def hours
    (total_minutes / 60) % 24
  end

  def minutes
    total_minutes % 60
  end

  private

  def zero_padded_hours
    zero_pad(hours.to_s)
  end

  def zero_padded_minutes
    zero_pad(minutes.to_s)
  end

  def zero_pad(unit_of_time)
    unit_of_time.rjust(2, '0')
  end
end

module BookKeeping
  VERSION = 2
end
