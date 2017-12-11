# Compare 2 strings
class StringComparer
  include Enumerable

	attr_reader :first_string, :second_string

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

  private

	def character_comparers
		if @character_comparers.empty?
			(0..last_position).to_a.each do |position|
				@character_comparers << CharacterComparer.new(
						first: first_string[position],
						second: second_string[position],
						position: position
				)
			end
		end
		@character_comparers
	end

	def last_position
		[first_string.length, second_string.length].max - 1
	end
end
