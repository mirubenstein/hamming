# Compare 2 characters
class CharacterComparer
  attr_reader :first, :second, :position

  def initialize(first:, second:, position:)
    @first = first
    @second = second
    @position = position
  end

  def different?
    first != second
  end
end
