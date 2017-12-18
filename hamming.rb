module StringExtension
  refine String do
    def difference_count(other_string)
      chars.zip(other_string.chars).count do |(char, other_char)|
        char != other_char
      end
    end
  end
end

# Calculate the Hamming difference between two DNA strands
module Hamming
  using StringExtension

  def self.compute(string, other_string)
    raise ArgumentError, 'Strings must be equal length.' unless string.length == other_string.length
    string.difference_count other_string
  end
end


module BookKeeping
  VERSION = 3
end
