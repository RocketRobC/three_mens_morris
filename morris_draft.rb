class LocationError < StandardError; end

class Morris
  MAX_X, MAX_Y = 2, 2
  MAX_PIECES = 3

  def initialize
    @board = []
  end

  def place_piece(player, opts = {})
    raise LocationError unless valid_board_location?(x, y) && valid_placement?(x, y)
    unless piece_limit_reached?
      @location_history[[x, y]] = player
    else

    end
  end

  def piece_limit_reached?(player)
    turn_count(player) >= MAX_PIECES
  end

  private
    
  def valid_board_location?(x, y)
    x <= MAX_X && y <= MAX_Y
  end

  def valid_placement?(x, y)
    !@location_history.keys.include?([x, y])
  end

  def turn_count(player)
    @location_history.values.select { |x| x == player }.count
  end
end

game = Morris.new
game.place_piece(0, 1, 1)
game.place_piece(1, 1, 0)
