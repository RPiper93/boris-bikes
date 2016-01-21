require './lib/bike.rb'

class DockingStation
  def initialize
    @bikes = []
  end

	def release_bike
    if @bikes == []
      raise 'No bikes available'
    else
		  @bikes.pop
    end
	end

	def dock(bikes)
    if @bikes.length > 19
      raise "Docking Station Full"
    else
  		@bikes << bikes
	   	bikes
    end
	end

	attr_reader :bikes
end
