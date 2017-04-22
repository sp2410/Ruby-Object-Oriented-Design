require 'spec_helper'
require "trip.rb"

describe "trip" do 

	before :each do
		
		@trip1 = Trip.new("07:15","07:45","17.3") #Dan
		@trip2 = Trip.new("06:12","06:32","12.9") #Dan
		@trip3 = Trip.new("12:01","13:16","42.0") #Alex

	end	


	describe "#initialize" do 
		it "initializes a trip" do			
			expect(@trip1).to be_an_instance_of(Trip)
		end

		it "initializes the attributes" do
			expect(@trip1.start_time).to eq("07:15")
			expect(@trip1.end_time).to eq("07:45")
			expect(@trip1.miles_driven).to eq("17.3")
			expect(@trip1.duration).to eq(30)

			expect(@trip2.start_time).to eq("06:12")
			expect(@trip2.end_time).to eq("06:32")
			expect(@trip2.miles_driven).to eq("12.9")
			expect(@trip2.duration).to eq(20)


			expect(@trip3.start_time).to eq("12:01")
			expect(@trip3.end_time).to eq("13:16")
			expect(@trip3.miles_driven).to eq("42.0")
			expect(@trip3.duration).to eq(75)
		end				
	end

	

	describe "#getavg" do 
		it "gets the average speed in mph for the trip" do 
			expect(@trip1.getavg).to eq(34.6)			
			expect(@trip2.getavg).to eq(38.7)			
			expect(@trip3.getavg).to eq(33.6)			
		end
	end

	describe "#time_diff" do
		it "gets the total trip time" do 
			expect(@trip1.triptime(@trip1.start_time,@trip1.end_time)).to eq(30.0)			
			expect(@trip2.triptime(@trip2.start_time,@trip2.end_time)).to eq(20.0)	
			expect(@trip3.triptime(@trip3.start_time,@trip3.end_time)).to eq(75.0)	
		end
	end

	
end