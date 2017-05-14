require_relative 'morris.rb'

@game = Morris.new
@players = 'p1', 'p2'

def turn(player)
  puts "Player #{player}: "
  move = STDIN.gets.chomp
  @game.place_piece(player, move)
  @win = check_for_win(player)
rescue => e
  puts e
  print_board
  turn(player)
end

def remove_piece(player)
  puts "Player #{player}, You've placed 3 pieces, which would you like to move?"
  move = STDIN.gets.chomp
  @game.remove_piece(player, move)
rescue => e
  puts e
  print_board
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

puts "Welcome to Three Men's Morris"
print_board
loop do
  @players.each do |player|
    remove_piece(player) if @game.count_pieces(player) >= 3
    turn(player)
    print_board
    break if @win
  end
  break if @win
end
