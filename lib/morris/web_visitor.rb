module Morris
  class WebVisitor
    CELLS = {
      'x' => '<td> - </td>',
      'p1' => '<td> 1 </td>',
      'p2' => '<td> 2 </td>'
    }

    def board
      @board ||= '<table><tr>'
    end

    def print_board
      board.chomp!('<tr>')
      board << '</table>'
      board
    end

    def print_cell(cell)
      board << translate(cell)
    end

    def new_line
      board << '</tr><tr>'
    end

    private

    def translate(cell)
      CELLS[cell]
    end
  end
end
