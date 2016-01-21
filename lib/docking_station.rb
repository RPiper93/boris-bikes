require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

	def release_bike
    raise 'No bikes available' if empty?
		@bikes.pop
	end

	def dock(bikes)
    raise "Docking Station Full" if full?
  	@bikes << bikes
	end

	attr_reader :bikes, :capacity

  private

  def full?
    if @bikes.length >= @capacity
      true
    end
  end

  def empty?
    if @bikes.length == 0
      true
    end
  end

end
