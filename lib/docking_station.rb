require_relative 'bike'
class DockingStation
  attr_reader :bikes


  def initialize(capacity = 20)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "No bike available" unless @bikes.count > 0
    @bikes.pop
  end

  def dock_bike(bike)

    raise "Too many bikes" if @bikes.count == @capacity
    @bikes << bike
  end

end
