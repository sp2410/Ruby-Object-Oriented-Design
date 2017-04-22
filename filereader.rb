require "./lib/fileprocessor"


#get the argument for file name
file = ARGV.first

#make a new FileProcessor
fp = FileProcessor.new(file.to_s)

#error checking

if fp 
	print "File Read Successfully\n" 
end

#Run the main method
callback = fp.process

#Error checking
if callback 
	print "Output Written as report.txt in this folder\n"
else
	print "Sorry! Some error happended! Please check the input file again\n"
end
