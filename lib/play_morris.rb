$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'morris'

control = Morris::Control.new
players = 'p1', 'p2'

puts "Welcome to Three Men's Morris"
control.print_board
players.cycle do |player|
  control.play(player)
  break if control.win
end
