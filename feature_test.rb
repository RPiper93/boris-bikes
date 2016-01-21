require './lib/docking_station.rb'
require './lib/bike.rb'

describe 'docks a certain number of bikes' do
  it 'docks twenty bikes' do
    station = DockingStation.new
    20.times {station.dock(Bike.new)}
    expect(station.bikes.length).to eq 20
  end
end

describe 'user can set capacity' do
  it 'sets capacity' do
    docking_station = DockingStation.new(15)
    expect(docking_station.capacity).to eq 15
  end

  it 'has a default capacity' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
 
describe 'broken bikes' do 
  it 'bike can be reported broken' do
    bike = Bike.new
    bike.report_broken
    expect(bike.working).to eq false
   end
   it 'does not release broken bikes' do
     bike = Bike.new
     bike.report_broken
     station = DockingStation.new
     station.dock(bike)
     expect { station.release_bike }.to raise_error "No bikes available"
   end
end
