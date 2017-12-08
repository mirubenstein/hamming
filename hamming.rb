class Difference
  def initialize(first:, second:, position:)
    @first = first
    @second = second
    @position = position
  end
end


class StringComparer
  def initialize(first_string:, second_string:)
    @first_string = first_string
    @second_string = second_string
    @differences = []
  end


  def equal_length?
    @first_string.length == @second_string.length
  end


  def differences
    @differences ||= []
    long_string.each_char.with_index(0) do |character, position|
      unless character == short_string[position]
        @differences << Difference.new(first: character, second: short_string[position], position: position)
      end
    end
    @differences
  end


  def difference_count
    differences.count
  end


  def long_string
    @long_string ||= if @first_string >= @second_string
                       @first_string
                     else
                       @second_string
                     end
  end


  def short_string
    @short_string ||= if @first_string < @second_string
                        @first_string
                      else
                        @second_string
                      end
  end
end


class Hamming
  def self.compute(first_dna_strand, second_dna_strand)
    string_comparer = StringComparer.new(first_string: first_dna_strand, second_string: second_dna_strand)
    raise ArgumentError unless string_comparer.equal_length?
    string_comparer.difference_count
  end

end


module BookKeeping
  VERSION = 3
end
