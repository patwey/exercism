class BeerSong
  VERSE_TWO = <<~TEXT
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
  TEXT

  VERSE_ONE = <<~TEXT
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
  TEXT

  VERSE_ZERO = <<~TEXT
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
  TEXT

  def verses(starting_bottles, ending_bottles)
    (ending_bottles..starting_bottles).to_a
                                      .reverse
                                      .map { |n| verse(n) }
                                      .join("\n")
  end

  def verse(number)
    case
    when number > 2 then generic_verse(number)
    when number == 2 then VERSE_TWO
    when number == 1 then VERSE_ONE
    when number == 0 then VERSE_ZERO
    else ''
    end
  end

  private

  def generic_verse(number)
    <<~TEXT
      #{number} bottles of beer on the wall, #{number} bottles of beer.
      Take one down and pass it around, #{number - 1} bottles of beer on the wall.
    TEXT
  end
end

module BookKeeping
  VERSION = 3
end
