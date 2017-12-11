require_relative 'book_keeping'
require_relative 'character_comparer'
require_relative 'string_comparer'

# Calculate the Hamming difference between two DNA strands
class Hamming
  def self.compute(first_dna_strand, second_dna_strand)
    string_comparer = StringComparer.new(
      first_string: first_dna_strand,
      second_string: second_dna_strand
    )
    raise ArgumentError unless string_comparer.equal_length?
    string_comparer.select(&:different?).count
  end
end
