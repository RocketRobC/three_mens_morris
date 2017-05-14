require 'rspec'
require_relative '../morris'

RSpec.describe Morris do
  before(:each) do
    @morris = Morris.new
  end

  it 'places a player identifier in a board location' do
    @morris.place_piece('p1', 'b2')
    expect(@morris.board).to eq([['x', 'x', 'x'], ['x', 'p1', 'x'], ['x', 'x', 'x']])
  end

  it 'removes a piece from the board' do
    @morris.place_piece('p1', 'a1')
    @morris.place_piece('p1', 'b2')
    @morris.remove_piece('p1', 'b2')
    result = [['p1', 'x', 'x'], ['x', 'x', 'x'], ['x', 'x', 'x']]
    expect(@morris.board).to eq result
  end

  it 'does not accept a position outside the board' do
    morris = Morris.new
    expect { morris.place_piece(:x, '4a') }.to raise_error PlacementError
    expect { morris.place_piece(:x, '1f') }.to raise_error PlacementError
  end

  it 'counts the player pieces on the board' do
    @morris.place_piece('p1', 'a2')
    @morris.place_piece('p1', 'b2')
    @morris.place_piece('p2', 'c2')
    expect(@morris.count_pieces('p1')).to eq 2
    expect(@morris.count_pieces('p2')).to eq 1
  end

  it 'returns false when a row or column does not have 3 matching pieces' do
    @morris.place_piece('p2', 'a1')
    @morris.place_piece('p2', 'b2')
    @morris.place_piece('p2', 'c2')
    expect(@morris.check_for_win).to be false
  end

  it 'returns true when a row has 3 matching pieces' do
    @morris.place_piece('p2', 'a1')
    @morris.place_piece('p2', 'a2')
    @morris.place_piece('p2', 'a3')
    expect(@morris.check_for_win).to be true
  end

  it 'returns true when a column has 3 matching pieces' do
    @morris.place_piece('p2', 'a1')
    @morris.place_piece('p2', 'b1')
    @morris.place_piece('p2', 'c1')
    expect(@morris.check_for_win).to be true
  end

  it 'returns true if the right to left diagonal has 3 matching pieces' do
    @morris.place_piece('p2', 'a3')
    @morris.place_piece('p2', 'b2')
    @morris.place_piece('p2', 'c1')
    expect(@morris.check_for_win).to be true
  end

  it 'returns true if the left to right diagonal has 3 matching pieces' do
    @morris.place_piece('p2', 'a1')
    @morris.place_piece('p2', 'b2')
    @morris.place_piece('p2', 'c3')
    expect(@morris.check_for_win).to be true
  end

  it 'returns true if the piece is placed in an occupied location' do
    @morris.place_piece('p2', 'a1')
    @morris.place_piece('p2', 'b2')
    @morris.place_piece('p2', 'c3')
    expect { @morris.place_piece('p1', 'c3') }.to raise_error PlacementError
  end
end
