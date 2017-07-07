module Morris
  describe WebVisitor do
    it 'shows the game board as HTML' do
      board = Board.new
      board.cells = [['x', 'p1', 'p2'], ['x', 'p1', 'p2'], ['x', 'p1', 'p2']]
      expect(board.view(WebVisitor.new)).to eq(result.chomp)
    end

    def result
      '<table><tr><td> </td><td> 1 </td><td> 2 </td></tr><tr><td> </td><td> 1 </td><td> 2 </td></tr><tr><td> </td><td> 1 </td><td> 2 </td></tr></table>'
      end
  end
end

