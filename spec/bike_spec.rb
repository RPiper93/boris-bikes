require "bike"
describe Bike do
  subject(:bike) {Bike.new}
	it {is_expected.to respond_to :working}
	
  it 'can be reported broken' do
    expect(bike).to respond_to :report_broken
  end
  
  it 'says bike is broken' do
    bike.report_broken
    expect(bike.working).to eq false
  end
end
