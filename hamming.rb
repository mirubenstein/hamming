# Calculate the Hamming difference between two DNA strands
module Hamming
  module StringExtension
    def equal_length?(other_string)
      length == other_string.length
    end

    def difference_count(other_string)
      chars.zip(other_string.chars).count do |(char, other_char)|
        char != other_char
      end
    end
  end

  def self.compute(string, other_string)
    string.extend StringExtension
    raise ArgumentError, 'Strings must be equal length.' unless string.equal_length? other_string
    string.difference_count other_string
  end
end


module BookKeeping
  VERSION = 3
end


