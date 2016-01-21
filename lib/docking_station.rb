require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

	def release_bike
    number_of_bikes = @bikes.length
      @bikes.each do |bike|
      if bike.working == true
        @bikes.delete(bike)
        return bike
      end
    end
    raise 'No bikes available'
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
