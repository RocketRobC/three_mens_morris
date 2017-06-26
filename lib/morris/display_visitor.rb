module Morris
  class DisplayVisitor
    CELLS = { 'x' => '|   ', 'p1' => '| 1 ', 'p2' => '| 2 ' }

    def board
      @board ||= ''
    end

    def print_board
      print board
      board
    end

    def print_cell(cell)
      board << translate(cell)
    end

    def new_line
      board << '|'
      board << "\n"
    end

    private

    def translate(cell)
      CELLS[cell]
    end
  end
end
