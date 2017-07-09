module Morris
  class WebIO
    def player_input(player)
      "Player #{player}"
    end

    def print_errors(e)
      "#{e}"
    end

    def try_again
      'Try Again'
    end

    def limit_reached(player)
      "Player #{player}, You've placed 3 pieces, which would you like to move?"
    end

    def print_win(player)
      "Player #{player} wins!"
    end

    def game_over
      'Game Over'
    end
  end
end
