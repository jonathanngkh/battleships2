require 'board'

describe Board do

  it 'has a fleet of ships' do
    expect(subject).to respond_to(:fleet)
  end

  it 'has an empty fleet at the start' do
    expect(subject.fleet).to be_empty
  end

  it { is_expected.to respond_to(:place).with(2).arguments }

  it { is_expected.to respond_to(:fire).with(1).argument }

  describe 'placing' do

    it 'stores the ship in the fleet' do
      ship = double :ship
      allow(ship).to receive(:position=)
      expect { subject.place(ship, 'A1') }.to change { subject.fleet.length }.from(0).to(1)
    end

    it 'sets the position of the ship as it is being placed' do
      ship = double :ship, :position => []
      #ship = Ship.new
      expect(ship).to receive(:position=).with(["A1"])
      subject.place(ship, 'A1')
    end

    it 'sets the position of the ship even with multiple positions' do
      ship = double :ship
      allow(ship).to receive(:position)
      expect(ship).to receive(:position=).with(["A1", "A2"])
      subject.place(ship, "A1, A2")
    end
  end

  describe 'firing' do

    it 'registers a hit when called' do
      ship = double :ship
      allow(ship).to receive(:position=).with( ['A1'] )
      subject.place(ship, 'A1')
      allow(ship).to receive(:position).and_return(['A1'])
      expect(subject.fire('A1')).to eq('Hit!')
    end

    it 'registers a miss when called but no boat in location' do
      expect(subject.fire('A1')).to eq('Miss!')
    end
  end





end