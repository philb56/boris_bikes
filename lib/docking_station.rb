require_relative 'bike'
class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Too many bikes" if @bikes.count == DEFAULT_CAPACITY
    @bikes << bike
  end

  private

  def full?
    @bikes.count == @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end

end
