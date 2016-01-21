class Bike
	def initialize
		@working = true
	end
  
  def report_broken
    @working = false
  end
  
  attr_reader :working

end
