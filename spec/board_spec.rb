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
      ship = Ship.new
      expect { subject.place(ship, :location) }.to change { subject.fleet.length }.from(0).to(1)
    end

    it 'sets the position of the ship as it is being placed' do
      #ship = double :ship, :position => ''
      ship = Ship.new
      expect { subject.place(ship, "A1") }.to change { ship.position }.from('').to('A1')
    end

  end



end