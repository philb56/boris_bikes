require_relative 'bike'
class DockingStation
  attr_reader :bike

  def initialize
    @bike = ""
  end

  def release_bike
    raise "No bike available" if @bike.empty?
    @bike
  end

  def dock_bike(bike)
    @bike = bike
  end

end
