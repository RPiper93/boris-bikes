require './lib/bike.rb'

class DockingStation
	def release_bike
    if @bike == nil
      raise 'No bikes available'
    else
		  @bike
    end
	end

	def dock(bike)
    raise "Docking Station Full" unless @bike == nil
		@bike = bike
		bike
	end

	attr_reader :bike
end
