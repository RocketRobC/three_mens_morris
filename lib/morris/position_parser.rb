module Morris
  class PlacementError < StandardError; end

  class PositionParser
    LETTERS = { 'A' => 0, 'B' => 1, 'C' => 2 }

    def initialize(input)
      @position = input.gets.chomp
    end

    def get_position
      @position.split(//).map do |c|
        c.to_i.zero? ? parse_letter(c) : parse_number(c)
      end
    end

    private

    def parse_number(number)
      return number.to_i - 1 if ('1'..'3').cover?(number)
      raise PlacementError, 'That move is outside the board'
    end

    def parse_letter(letter)
      return LETTERS[letter.upcase] if LETTERS.keys.include?(letter.upcase)
      raise PlacementError, 'That move is outside the board'
    end
  end
end
