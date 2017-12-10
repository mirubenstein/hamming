class CharacterComparer
  attr_accessor :first, :second, :position

  def initialize(first:, second:, position:)
    @first = first
    @second = second
    @position = position
  end

  def different?
    first != second
  end
end


class StringComparer
  include Enumerable

  attr_accessor :first_string, :second_string

  def initialize(first_string:, second_string:)
    @first_string = first_string
    @second_string = second_string
    @character_comparers = []
  end


  def each
    character_comparers.each { |character_comparer| yield character_comparer }
  end


  def equal_length?
    first_string.length == second_string.length
  end


  def character_comparers
    if @character_comparers.empty?
      (0..([first_string.length, second_string.length].max - 1)).to_a.each do |position|
        @character_comparers << CharacterComparer.new(first: first_string[position],
                                                      second: second_string[position],
                                                      position: position)
      end
    end
    @character_comparers
  end
end


class Hamming
  def self.compute(first_dna_strand, second_dna_strand)
    string_comparer = StringComparer.new(first_string: first_dna_strand, second_string: second_dna_strand)
    raise ArgumentError unless string_comparer.equal_length?
    string_comparer.select(&:different?).count
  end
end


module BookKeeping
  VERSION = 3
end
