require 'docking_station'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}

	it "doesn't release bike when there isn't one" do
		expect {subject.release_bike}.to raise_error 'No bikes available'
	end

	it "releases bike" do
		new_bike = Bike.new
		subject.dock(new_bike)
		bike = subject.release_bike
		expect(bike).to eq new_bike
	end

	it "return bike has one argument" do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	it "docks a bike" do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
	end

	it "can't dock more than one bike" do
		station = subject
    bike = Bike.new
    station.dock(bike)
    bike_2 = Bike.new
    expect {station.dock(bike_2)}.to raise_error "Docking Station Full"
  end

end
