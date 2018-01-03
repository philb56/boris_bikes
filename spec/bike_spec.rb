require 'docking_station'

describe Bike do
  it {is_expected.to respond_to(:working?)}

  it 'is working' do
    #bike = Bike.new
    expect(Bike.new).to be_working
  end
end
