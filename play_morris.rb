require_relative 'morris.rb'
require_relative 'position_parser.rb'

@game = Morris.new
@players = 'p1', 'p2'

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

def check_for_win(player)
  return false unless @game.check_for_win
  puts "Player #{player} wins!"
  puts 'Game Over'
  true
end

def print_board
  @game.board.each { |line| print "#{line}\n" }
end

def input
  PositionParser.new(STDIN)
end

puts "Welcome to Three Men's Morris"
print_board
@players.cycle do |player|
  remove_piece(player) if @game.count_pieces(player) >= 3
  turn(player)
  print_board
  break if @win
end
