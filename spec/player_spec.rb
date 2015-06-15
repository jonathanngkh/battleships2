require 'player'

describe Player do

  it { is_expected.to respond_to(:place).with(2).argument }

  describe 'place' do
    it 'should place a ship in the desired location' do
      expect(subject.place '1', [0]).to eq ['1']
    end
  end
end
