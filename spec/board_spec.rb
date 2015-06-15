require 'board'

describe Board do

  it { is_expected.to respond_to(:dimensions).with(1).argument }

  describe 'dimensions' do
    it 'creates a board with the given dimensions' do
      expect(subject.dimensions 2).to eq [['0', '0'], ['0', '0']]
    end
  end

end
