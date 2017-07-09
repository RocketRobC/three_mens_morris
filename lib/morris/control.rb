module Morris
  class Control
    attr_reader :win, :io_output

    def initialize(visitor = DisplayVisitor,
                   io = TerminalIO.new,
                   game = Board.new)
      @game = game
      @display = visitor
      @io = io
    end

    def play(player, input)
      remove_piece(player) if piece_limit_reached?(player)
      turn(player, input)
      print_board
    end

    def print_board
      @game.view(@display.new)
    end

    private

    def set_io_output(method, args = nil)
      @io_output = if args
                     @io.send(method, args)
                   else
                     @io.send(method)
                   end
    end

    def turn(player, input)
      set_io_output(:player_input, player)
      move = input.get_position
      @game.place_piece(player, move)
      @win = check_for_win(player)
    rescue PlacementError => e
      error_action(e)
      turn(player)
    end

    def remove_piece(player)
      @io.limit_reached(player)
      move = input.get_position
      @game.remove_piece(player, move)
    rescue PlacementError => e
      error_action(e)
      remove_piece(player)
    end

    def error_action(e)
      print_board
      set_io_output(:print_errors, e)
      set_io_output(:try_again)
    end

    def piece_limit_reached?(player)
      @game.count_pieces(player) >= 3
    end

    def check_for_win(player)
      return false unless @game.check_for_win
      set_io_output(:print_win, player)
      set_io_output(:game_over)
      true
    end
  end
end
