module Morris
  class PlacementError < StandardError; end

  class Board
    PLACEHOLDER = PH = 'x'.freeze

    attr_accessor :cells

    def initialize
      @cells = [[PH, PH, PH], [PH, PH, PH], [PH, PH, PH]]
    end

    def view(visitor)
      cells.each do |row|
        row.each do |cell|
          visitor.print_cell(cell)
        end
        visitor.new_line
      end
      visitor.print_board
    end

    def place_piece(player, position)
      x, y = position
      cells[x][y] = player unless location_occupied?(x, y)
    end

    def remove_piece(player, position)
      x, y = position
      return cells[x][y] = PH if cells[x][y] == player
      raise PlacementError, "You don't have a piece in that position"
    end

    def count_pieces(player)
      cells.flatten.count { |p| p == player }
    end

    def check_for_win
      check_rows ||
        check_columns ||
        check_lr_diag ||
        check_rl_diag
    end

    private

    def location_occupied?(x, y)
      return false if cells[x][y] == PH
      raise PlacementError, "There's already a piece in that position"
    end

    def check_rows
      cells.any? do |row|
        row.all? { |i| i == row[0] unless row[0] == PH }
      end
    end

    def check_columns
      mapped_cols.any? do |col|
        col.all? { |i| i == col[0] unless col[0] == PH }
      end
    end

    def check_lr_diag
      arr = (0..2).map { |i| cells[i][i] }
      arr.all? { |i| i == arr[0] unless arr[0] == PH }
    end

    def check_rl_diag
      arr = (0..2).map { |i| cells[i][2 - i] }
      arr.all? { |i| i == arr[0] unless arr[0] == PH }
    end

    def mapped_cols
      (0..2).map do |i|
        cells.map { |row| row[i] }
      end
    end
  end
end
