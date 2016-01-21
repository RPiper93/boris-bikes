require './lib/docking_station.rb'
require './lib/bike.rb'

describe 'docks a certain number of bikes' do
  it 'docks twenty bikes' do
    station = DockingStation.new
    20.times {station.dock(Bike.new)}
    expect(station.bikes.length).to eq 20
  end
end


