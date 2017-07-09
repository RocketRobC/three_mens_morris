$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'morris'

display_options = { 'terminal' => [Morris::DisplayVisitor, Morris::TerminalIO.new], 'web' => Morris::WebVisitor }
display = ARGV[0]

control = Morris::Control.new(display_options[display][0],
                              display_options[display][1])
players = 'p1', 'p2'

puts "Welcome to Three Men's Morris"
control.print_board
players.cycle do |player|
  control.play(player, Morris::PositionParser.new(Morris::TerminalInput.new))
  break if control.win
end
