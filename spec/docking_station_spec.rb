require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike) }

  it 'is working' do
    #bike = Bike.new
    expect(Bike.new).to be_working
  end

  it 'bike can be docked' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it 'bike exists' do
    expect{subject.release_bike}.to raise_error("No bike available")
  end
end
