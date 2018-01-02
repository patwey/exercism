class Pangram
  def self.pangram?(sentence)
    letters = sentence.downcase.split('').uniq
    alphabet = ('a'..'z').to_a
    letters.each { |letter| alphabet.delete(letter) }
    alphabet.empty?
  end
end

module BookKeeping
  VERSION = 5
end
