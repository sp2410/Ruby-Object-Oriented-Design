require 'spec_helper'
require "driver.rb"
require "trip.rb"


describe "Driver" do 

	before :each do
		@driver = Driver.new("Dan")
		@driver2 = Driver.new("Alex")
		@driver3 = Driver.new("Bob")


		@trip1 = Trip.new("07:15","07:45","17.3") #Dan
		@trip2 = Trip.new("06:12","06:32","12.9") #Dan		
		@trip3 = Trip.new("12:01","13:16","42.0") #Alex
		@trip4 = Trip.new("06:12","06:32","12.9") #Dan

	end	

	describe "#initialize" do 
		it "initializes a driver" do			
			expect(@driver).to be_an_instance_of(Driver)
		end

		it "initializes total_miles and avg_speed " do
			expect(@driver.total_miles).to eq(0)
			expect(@driver.avg_speed).to eq(0)
		end				
	end

	describe "#drivers_new_total" do 
		it "gets the new total for the driver for new input" do 
			@newtotal = @driver.drivers_new_total(@trip1)
			expect(@newtotal).to eq(17)
			@newtotal = @driver.drivers_new_total(@trip2)
			expect(@newtotal).to eq(30)			
		end
	end

	describe "drivers_new_avg" do 
		it "gets the new running average speed for the driver" do 
			@driver.drivers_new_avg(@trip1)
			expect(@driver.avg_speed).to eq(34.6)			

			@driver.drivers_new_avg(@trip2)
			expect(@driver.total_miles).to eq(30)			
			expect(@driver.avg_speed).to eq(36.257242990654206)	


			@driver.drivers_new_avg(@trip4)
			expect(@driver.total_miles).to eq(43)			
			expect(@driver.avg_speed).to eq(36.95872856373559)	

			@driver2.drivers_new_avg(@trip3)
			expect(@driver2.avg_speed).to eq(33.6)			

		end
	end


end











