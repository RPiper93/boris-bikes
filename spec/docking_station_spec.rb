require 'docking_station'

describe DockingStation do
  subject(:station) { DockingStation.new }
  let(:bike) { Bike.new }

	it {is_expected.to respond_to :release_bike}

	it "doesn't release bike when there isn't one" do
		expect {station.release_bike}.to raise_error 'No bikes available'
	end

	it "releases bike" do
		station.dock(bike)
		expect(station.release_bike).to eq bike
	end

	it "return bike has one argument" do
		expect(station).to respond_to(:dock).with(1).argument
	end

  it "can dock twenty bikes" do
    DockingStation::DEFAULT_CAPACITY.times do
      station.dock(bike)
    end
    expect(station.bikes.length).to eq 20
  end

	it "can't dock more bikes when full" do
    station.capacity.times {station.dock(bike)}
    expect {station.dock(bike)}.to raise_error "Docking Station Full"
  end

  it 'initializes with one argument' do
    expect(described_class).to respond_to(:new).with(1).argument
  end

  it 'can check the capacity' do
    new_station = described_class.new(14)
    expect(new_station.capacity).to eq 14
  end

  it 'capacity returns 20 if no argument given' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  
  it 'does not release a broken bike' do
    bike.report_broken
    station.dock(bike)
    expect { station.release_bike }.to raise_error "No bikes available"
  end
  
  it 'returns working bike if one is docked' do
    station.dock(bike)
    bike_2 = Bike.new
    bike_2.report_broken
    station.dock(bike_2)
    expect(station.release_bike).to eq bike 
  end

end
