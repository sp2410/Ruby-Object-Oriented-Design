class Driver
	attr_accessor :name, :total_miles, :avg_speed

	#Initialization with the require attributes
	def initialize(name)
		@name = name
		@total_miles = 0
		@avg_speed = 0
		@new_total_miles = 0
	end

	#Calculating drivers new total
	def drivers_new_total(trip)
		@new_total_miles = (@new_total_miles + trip.miles_driven.to_f).round
	end

	#Calculating drivers new average including the new trip and the old average
	def drivers_new_avg(trip)
		
		drivers_new_total(trip)

		if @avg_speed == 0
			@avg_speed = trip.getavg
		else			
			@avg_speed = ((@total_miles + trip.miles_driven.to_f)/((@total_miles/@avg_speed)+(trip.duration/60.0)))
		end

		#Setting total miles to new total miles for upcoming next trip
		@total_miles = @new_total_miles
		
	end
end