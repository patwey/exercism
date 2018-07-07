class SpaceAge
  MERCURY_ORBIT_SECONDS = 7_600_543.8
  VENUS_ORBIT_SECONDS   = 19_414_149.1
  EARTH_ORBIT_SECONDS   = 31_557_600.0
  MARS_ORBIT_SECONDS    = 59_354_032.7
  JUPITER_ORBIT_SECONDS = 374_355_659.1
  SATURN_ORBIT_SECONDS  = 929_292_362.8
  URANUS_ORBIT_SECONDS  = 2_651_370_019.3
  NEPTUNE_ORBIT_SECONDS = 5_200_418_560.0

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    seconds / EARTH_ORBIT_SECONDS
  end

  def on_mercury
    seconds / MERCURY_ORBIT_SECONDS
  end

  def on_venus
    seconds / VENUS_ORBIT_SECONDS
  end

  def on_mars
    seconds / MARS_ORBIT_SECONDS
  end

  def on_jupiter
    seconds / JUPITER_ORBIT_SECONDS
  end

  def on_saturn
    seconds / SATURN_ORBIT_SECONDS
  end

  def on_uranus
    seconds / URANUS_ORBIT_SECONDS
  end

  def on_neptune
    seconds / NEPTUNE_ORBIT_SECONDS
  end

  private

  attr_reader :seconds
end

module BookKeeping
  VERSION = 1
end
