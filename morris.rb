class PlacementError < StandardError; end

class Morris
  PLACEHOLDER = PH = 'x'.freeze

  attr_reader :board

  def initialize
    @board = [[PH, PH, PH], [PH, PH, PH], [PH, PH, PH]]
  end

  def place_piece(player, position)
    x, y = position_parser(position)
    board[x][y] = player unless location_occupied?(position)
  end

  def remove_piece(player, position)
    x, y = position_parser(position)
    if player_location(position) == player
      board[x][y] = PH
    else
      raise PlacementError, "You don't have a piece in that position"
    end
  end

  def count_pieces(player)
    board.flatten.count { |p| p == player }
  end

  def player_location(position)
    x, y = position_parser(position)
    board[x][y]
  end

  def check_for_win
    check_rows(board) ||
      check_columns(board) ||
      check_lr_diag(board) ||
      check_rl_diag(board)
  end

  private

  def location_occupied?(position)
    return false if player_location(position) == 'x'
    raise PlacementError, "There's already a piece in that position"
  end

  def position_parser(position)
    position.split(//).map do |c|
      c.to_i.zero? ? parse_letter(c) : parse_number(c)
    end
  end

  def parse_number(number)
    return number.to_i - 1 if ('1'..'3').cover?(number)
    raise PlacementError, 'That move is outside the board'
  end

  def parse_letter(letter)
    return letter_hash[letter.upcase] if letter_hash.keys.include?(letter.upcase)
    raise PlacementError, 'That move is outside the board'
  end

  def letter_hash
    { 'A' => 0, 'B' => 1, 'C' => 2 }
  end

  def check_rows(board)
    board.any? do |row|
      row.all? { |i| i == row[0] unless row[0] == PH }
    end
  end

  def check_columns(board)
    mapped_cols(board).any? do |col|
      col.all? { |i| i == col[0] unless col[0] == PH }
    end
  end

  def check_lr_diag(board)
    arr = (0..2).map { |i| board[i][i] }
    arr.all? { |i| i == arr[0] unless arr[0] == PH }
  end

  def check_rl_diag(board)
    arr = (0..2).map { |i| board[i][2 - i] }
    arr.all? { |i| i == arr[0] unless arr[0] == PH }
  end

  def mapped_cols(board)
    (0..2).map do |i|
      board.map { |row| row[i] }
    end
  end
end
