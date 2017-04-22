require 'spec_helper'
require "fileprocessor.rb"
require "trip.rb"
require "driver.rb"

describe "FileProcessor" do 
	before :each do
		@newprocessor = FileProcessor.new("input.txt")		
	end	


	describe "#initialize" do 
		it "initializes a FileProcessor" do			
			expect(@newprocessor).to be_an_instance_of(FileProcessor)
		end
	end

	describe "#process" do 
		it "reads data from a file" do			
			expect(@newprocessor.process).to be_an_instance_of(Hash)
		end
	end

	describe "#writefile" do 
		it "writes to a file" do
			@newprocessor.process			
			@newprocessor.writefile
			myarray = ["Alex: 42 miles @ 34 mph\n","Dan: 30 miles @ 36 mph\n","Bob: 0 miles @ 0 mph\n"]
			i=0

			File.open("report.txt").each do |line|
				line = line.to_s
				if (line == myarray[i])					
					i=i+1
				else
					p "test failed"
					return -1
				end
			end
		end
	end

	describe "#mysort" do 
		it "sorts the data " do	
			@newprocessor.process
			@newprocessor.mysort	
			expect(@newprocessor.mysort).to be_an_instance_of(Hash)

			expected_array = ["Alex","Dan","Bob"]

			i= 0

			@newprocessor.mysort.each do |key, value|
				expect(key).to eq (expected_array[i])
				i=i+1
			end			
			
		end
	end


end
