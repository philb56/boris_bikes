require_relative 'bike'
class DockingStation
  attr_reader :bike

  def initialize
    @bike = nil
  end

  def release_bike
    raise "No bike available" unless @bike
    @bike
  end

  def dock_bike(bike)
    raise "Too many bikes" if @bike
    @bike = bike
  end

end
