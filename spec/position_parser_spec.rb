require 'rspec'
require_relative '../position_parser.rb'

RSpec.describe PositionParser do
  it 'accepts a board position and returns an array' do
    position = PositionParser.new(StringIO.new('b2'))
    expect(position.get_position).to eq [1, 1]
  end

  it 'rejects move outside the board' do
    position = PositionParser.new(StringIO.new('d4'))
    expect { position.get_position }.to raise_error PlacementError
  end
end


