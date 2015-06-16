require 'board'

describe Board do

  it 'has a fleet of ships' do
    expect(subject).to respond_to(:fleet)
  end

  it 'has an empty fleet at the start' do
    expect(subject.fleet).to be_empty
  end

  it { is_expected.to respond_to(:place).with(2).arguments }

  describe 'placing' do

    it 'stores the ship in the fleet' do
      ship = double :ship
      expect { subject.place(ship, :location) }.to change { subject.fleet.length }.from(0).to(1)
    end

  end

  

end