$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'morris'

display_options = { 'terminal' => Morris::DisplayVisitor, 'web' => Morris::WebVisitor }
display = ARGV[0]

control = Morris::Control.new(display_options[display])
players = 'p1', 'p2'

puts "Welcome to Three Men's Morris"
control.print_board
players.cycle do |player|
  control.play(player)
  break if control.win
end
