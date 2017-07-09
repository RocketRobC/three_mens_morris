module Morris
  class TerminalIO
    def player_input(player)
      puts "Player #{player}: "
    end

    def print_errors(e)
      puts e
    end

    def try_again
      puts 'Try again'
    end

    def limit_reached(player)
      puts "Player #{player}, You've placed 3 pieces, which would you like to move?"
    end

    def print_win(player)
      puts "Player #{player} wins!"
    end

    def game_over
      puts 'Game Over'
    end
  end
end
