module Morris
  class DisplayVisitor
    CELLS = { 'x' => '|   ', 'p1' => '| 1 ', 'p2' => '| 2 ' }

    def visit(board)
      cells = ''
      board.cells.each do |row|
        row.each do |marker|
          cells << cell(marker)
        end
        cells << '|'
        cells << "\n"
      end
      print cells
      cells
    end

    private

    def cell(marker)
      CELLS[marker]
    end
  end
end
