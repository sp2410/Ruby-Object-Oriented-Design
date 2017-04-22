require 'time' 

class Trip
	attr_accessor :start_time, :end_time, :miles_driven, :duration

	#Initializing as per the requirements
	def initialize(start_time, end_time, miles_driven)
		@start_time = start_time
		@end_time = end_time
		@miles_driven =  miles_driven

		#caching a duration variable in minutes for easy calculations
		@duration =  triptime(@start_time, @end_time)
	end

	#Finding the average for the new trip
	def getavg
		if  @duration == 0
			return 0
		else
			return ((@miles_driven.to_f / @duration)*60)
		end
	end

	#Method to calulate triptime in minutes, for precision
	def triptime(time1, time2)

	  #For precision let the answer be in minutes
	  t = ((Time.parse(time2) - Time.parse(time1))/60)
	  t
	end

end