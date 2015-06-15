require 'battleship'

describe Battleship do

  it { is_expected.to respond_to :won? }

  describe 'won?' do
    it 'should say when the game is won' do
      expect(subject.won?).to eq 'You win!'
    end
  end
end
