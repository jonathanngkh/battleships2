require 'ship'

describe Ship do

  it 'has a position' do
    expect(subject).to respond_to(:position)
  end

  it 'has a record of the number of lives' do
    expect(subject).to respond_to(:lives)
  end

  it { is_expected.to respond_to(:hit).with(1).argument }

  describe 'hit' do
    it 'subtracts lives by 1 when hit' do
      subject.lives = 1
      expect { subject.hit('A1') }.to change { subject.lives }.by(-1)
    end

    it 'deletes a position from its position array if hit' do
      ship = Ship.new
      ship.lives = 1
      ship.position = ["A1"]
      expect { ship.hit('A1') }.to change { ship.position.length }.by(-1)
    end
  end

end