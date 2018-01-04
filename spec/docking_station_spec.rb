require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike) }

  it 'bike can be docked' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it 'bike exists' do
    expect{subject.release_bike}.to raise_error("No bike available")
  end
  describe '#dock' do
    it 'raises an error when full - default' do
      DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(Bike.new)}
      expect{subject.dock_bike(Bike.new)}.to raise_error("Too many bikes")
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock_bike Bike.new }
      expect{ docking_station.dock_bike Bike.new }.to raise_error 'Too many bikes'
    end
  end

  it 'can pass capacity when DockingStation.new' do
    expect{DockingStation.new 15}.not_to raise_error
  end

  it 'capacity=15 when DockingStation.new(15)' do
    dock = DockingStation.new 15
    expect(dock.capacity).to eq 15
  end

  it 'capacity=DEFAULT_CAPACITY when DockingStation.new' do
    dock = DockingStation.new
    expect(dock.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
