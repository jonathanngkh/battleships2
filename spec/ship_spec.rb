require 'ship'

describe Ship do

  it 'has a position' do
    expect(subject).to respond_to(:position)
  end

  it 'has a record of the number of lives' do
    expect(subject).to respond_to(:lives)
  end

  it { is_expected.to respond_to(:hit) }

  describe 'hit' do
    it 'subtracts lives by 1 when hit' do
      subject.lives = 1
      expect { subject.hit }.to change { subject.lives }.by(-1)
    end
  end

  


  # it 'records when it has been hit' do
  #   expect(subject).to respond_to(:hit)
  # end

  # describe 'getting hit' do

  #   it 'reduces the number of lives when hit'

  # end


end