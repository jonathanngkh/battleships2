require 'ship'

describe Ship do

  it { is_expected.to respond_to(:make_ship).with(1).argument }

  describe 'make_ship' do
    it 'creates a ship with the appropriate size' do
      expect(subject.make_ship 2).to eq '11'
    end
  end

  describe 'sunk?' do
    it 'says if a ship is sunk' do
      board = double :board
      board = ['X']
      expect(subject.sunk? board).to eq true
    end
  end
end
