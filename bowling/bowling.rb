class Game
  MIN_ROLL = 0
  MAX_ROLL = 10

  attr_accessor :active_frame_number

  def initialize
    @frames = Array.new(9) { |idx| Frame.new(idx) } << BonusFrame.new(9)
    @active_frame_number = 0
  end

  def roll(pins)
    raise BowlingError if invalid_roll?(pins)
    active_frame.add_roll(pins)
    activate_next_frame if active_frame.full?
  end

  def score
    raise BowlingError unless frames.all?(&:full?)
    frames.map { |frame| score_frame(frame) }.reduce(:+)
  end

  private

  attr_reader :frames

  def score_frame(frame)
    if frame.spare?
      score_spare(frame)
    elsif frame.strike?
      score_strike(frame)
    else
      frame.total_pins
    end
  end

  def score_strike(frame)
    if frame.is_a?(BonusFrame)
      frame.total_pins
    else
      bonus_rolls = Array.new(frames.fetch(frame.number + 1).rolls.first(2))
      bonus_rolls << frames.fetch(frame.number + 2).rolls.first if bonus_rolls.count < 2
      frame.total_pins + bonus_rolls.reduce(:+)
    end
  end

  def score_spare(frame)
    frame.total_pins + frames.fetch(frame.number + 1).rolls.first
  end

  def active_frame
    frames.fetch(active_frame_number)
  end

  def activate_next_frame
    self.active_frame_number += 1
  end

  def invalid_roll?(pins)
    frames.all?(&:full?) ||
      pins < MIN_ROLL ||
      pins > MAX_ROLL ||
      over_max?(active_frame, pins)
  end

  def over_max?(frame, pins)
    frame.total_pins + pins > frame.max_pins
  end

  class BowlingError < StandardError; end
end

class Frame
  attr_reader :number, :rolls

  def initialize(number)
    @number = number
    @rolls = []
  end

  def add_roll(pins)
    rolls << pins
  end

  def full?
    strike? || rolls.count == 2
  end

  def total_pins
    rolls.reduce(:+) || 0
  end

  def spare?
    full? && !strike? && total_pins == 10
  end

  def strike?
    rolls.first == 10
  end

  def max_pins
    10
  end
end

class BonusFrame < Frame
  def full?
    rolls.count == 3 || (rolls.count == 2 && rolls[0] + rolls[1] < 10)
  end

  def max_pins
    if (rolls.first(2).reduce(:+) || 0) < 20
      20
    else
      30
    end
  end
end

module BookKeeping
  VERSION = 3
end
