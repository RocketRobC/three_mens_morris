require 'rspec'
require_relative '../morris'

RSpec.describe Morris do
  before(:each) do
    @morris = Morris.new
  end

  it 'places a player identifier in a board location' do
    @morris.place_piece('p1', [1, 1])
    expect(@morris.board).to eq([['x', 'x', 'x'], ['x', 'p1', 'x'], ['x', 'x', 'x']])
  end

  it 'removes a piece from the board' do
    @morris.place_piece('p1', [0, 0])
    @morris.place_piece('p1', [1, 1])
    @morris.remove_piece('p1', [1, 1])
    result = [['p1', 'x', 'x'], ['x', 'x', 'x'], ['x', 'x', 'x']]
    expect(@morris.board).to eq result
  end

  it 'counts the player pieces on the board' do
    @morris.place_piece('p1', [0, 1])
    @morris.place_piece('p1', [1, 1])
    @morris.place_piece('p2', [2, 1])
    expect(@morris.count_pieces('p1')).to eq 2
    expect(@morris.count_pieces('p2')).to eq 1
  end

  it 'returns false when a row or column does not have 3 matching pieces' do
    @morris.place_piece('p2', [0, 0])
    @morris.place_piece('p2', [1, 1])
    @morris.place_piece('p2', [2, 1])
    expect(@morris.check_for_win).to be false
  end

  it 'returns true when a row has 3 matching pieces' do
    @morris.place_piece('p2', [0, 0])
    @morris.place_piece('p2', [0, 1])
    @morris.place_piece('p2', [0, 2])
    expect(@morris.check_for_win).to be true
  end

  it 'returns true when a column has 3 matching pieces' do
    @morris.place_piece('p2', [0, 0])
    @morris.place_piece('p2', [1, 0])
    @morris.place_piece('p2', [2, 0])
    expect(@morris.check_for_win).to be true
  end

  it 'returns true if the right to left diagonal has 3 matching pieces' do
    @morris.place_piece('p2', [0, 2])
    @morris.place_piece('p2', [1, 1])
    @morris.place_piece('p2', [2, 0])
    expect(@morris.check_for_win).to be true
  end

  it 'returns true if the left to right diagonal has 3 matching pieces' do
    @morris.place_piece('p2', [0, 0])
    @morris.place_piece('p2', [1, 1])
    @morris.place_piece('p2', [2, 2])
    expect(@morris.check_for_win).to be true
  end

  it 'returns true if the piece is placed in an occupied location' do
    @morris.place_piece('p2', [0, 0])
    @morris.place_piece('p2', [1, 1])
    @morris.place_piece('p2', [2, 2])
    expect { @morris.place_piece('p1', [2, 2]) }.to raise_error PlacementError
  end
end
