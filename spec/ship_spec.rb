require 'ship'

describe Ship do
  it 'has a position' do
    expect(subject).to respond_to(:position)
  end
end