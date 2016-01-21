require './lib/docking_station.rb'
require './lib/bike.rb'

station = DockingStation.new
puts "station = #{station}"
bike = Bike.new
puts "bike = #{bike}"
puts "station.dock(bike) = #{station.dock(bike)}"
puts "station.bike = #{station.bike}"

bike_2 = Bike.new
puts "bike_2 = #{bike_2}"
puts "station.dock(bike_2) = #{station.dock(bike_2)}"
