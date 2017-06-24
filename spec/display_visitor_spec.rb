module Morris
  describe DisplayVisitor do
    it 'shows the board of the game' do
      board = Board.new
      board.cells = [['x', 'p1', 'p2'], ['x', 'p1', 'p2'], ['x', 'p1', 'p2']]
      expect(board.view(DisplayVisitor.new)).to eq <<EOM
|   | 1 | 2 |
|   | 1 | 2 |
|   | 1 | 2 |
EOM
    end
  end
end
