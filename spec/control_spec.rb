require 'rspec'
require_relative '../control.rb'

RSpec.describe Control do
  let(:p1) { 'p1' }
  let(:p2) { 'p2' }

  it 'accepts a turn from a player' do
    control = Control.new
    expect(STDIN).to receive(:gets) { 'a1' }
    expect(control.play(p1)).to eq [['p1', 'x', 'x'], ['x','x','x'], ['x','x','x']]
  end
end
