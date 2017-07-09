module Morris
  describe PositionParser do
    it 'accepts a board position and returns an array' do
      allow(STDIN).to receive(:gets).and_return('b2')
      position = PositionParser.new(TerminalInput.new)
      expect(position.get_position).to eq [1, 1]
    end

    it 'rejects move outside the board' do
      allow(STDIN).to receive(:gets).and_return('d4')
      position = PositionParser.new(TerminalInput.new)
      expect { position.get_position }.to raise_error PlacementError
    end
  end
end
