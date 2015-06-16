require 'ship'

describe Ship do

  it 'has a position' do
    expect(subject).to respond_to(:position)
  end

  it 'has a record of the number of lives' do
    expect(subject).to respond_to(:lives)
  end

  it 'has the same number of lives as its size' do
    subject.position = ['A1', 'A2']
    expect(subject.lives).to eq(subject.position.length)
  end

end