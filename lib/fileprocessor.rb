require "./lib/driver"
require "./lib/trip"


class FileProcessor

	attr_accessor :input

	#Initializing as per the requirements and the best data structures which will be handy
	def initialize(input)
		@mydict = Hash.new
		@input = input
		@finalarray = []
		@output = 'report.txt'
	end


	def writefile
		#Writer method which sorts the output first, and then write to the output file
		mysort

		begin
			File.open(@output.to_s, 'w+') { |file| 
				@mydict.each do |key,value|
					file.write "#{value.name}: #{value.total_miles.round} miles @ #{value.avg_speed.round} mph\n" 
				end
			}
		rescue Errno::ENOENT => e
			#Error catching 
		 return false
		end		

	end

	
		
	def mysort		
		#Sort the dictionary according to total_miles in descending order
		@mydict = @mydict.to_a		
		@mydict.sort! { |a, b|  b[1].total_miles <=> a[1].total_miles}		
		@mydict = @mydict.to_h
		@mydict
				
	end



	def process
		# Main function which reads the inputs, uses command for creating objects, and 
		# caculating the required paramerters for the objects
		begin

			File.open(@input.to_s).each do |line|

				arr = line.split(' ')			

				if (arr[0].to_s.eql? "Driver")
					@mydict[arr[1].to_s] = Driver.new(arr[1].to_s)				
					 # p @mydict[arr[1].to_s]
				elsif (arr[0].to_s.eql? "Trip")
					
					if @mydict[arr[1].to_s]										
						driver = @mydict[arr[1].to_s] 					
						trip = Trip.new(arr[2].to_s,arr[3].to_s,arr[4].to_s)

						#Checking the Corner cases
						if (trip.getavg > 4.to_f ) and (trip.getavg < 101.to_f ) 
							driver.drivers_new_avg(trip)
						end									
					end			
				end			
			end
			
			writefile			
			return @mydict

		rescue Errno::ENOENT => e
			#Error catching 
		  return false
		end				
	end

	

end