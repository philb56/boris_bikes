require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "No bike available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Too many bikes" if full?
    @bikes << bike
  end

  private
  attr_reader :bikes

  def full?
    @bikes.count == @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end


end
