module Morris
  class Control
    attr_reader :win

    def initialize(game = Board.new)
      @game = game
    end

    def play(player)
      remove_piece(player) if piece_limit_reached?(player)
      turn(player)
      print_board
    end

    def print_board
      @game.view(DisplayVisitor.new)
    end

    private

    def turn(player)
      puts "Player #{player}: "
      move = input.get_position
      @game.place_piece(player, move)
      @win = check_for_win(player)
    rescue PlacementError => e
      print_board
      puts e
      puts 'Try again'
      turn(player)
    end

    def remove_piece(player)
      puts "Player #{player}, You've placed 3 pieces, which would you like to move?"
      move = input.get_position
      @game.remove_piece(player, move)
    rescue PlacementError => e
      print_board
      puts e
      puts 'Try again'
      remove_piece(player)
    end

    def piece_limit_reached?(player)
      @game.count_pieces(player) >= 3
    end

    def check_for_win(player)
      return false unless @game.check_for_win
      puts "Player #{player} wins!"
      puts 'Game Over'
      true
    end

    def input
      PositionParser.new(STDIN)
    end
  end
end
