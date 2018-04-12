Hi! :)

I constructed the classes and the project stucture thinking about single responsibility principle (SRP).

I was thinking a running/moving average method would be better choice so a Driver would have his own 
total miles and his own average speed, which makes sense to me. as per SRP. 

Similarly, each trip would have a duration and an average speed.

-------------------------------------------------------------------------------------------------------------

RUNNING CODE:

Now, When you are in the folder "root_problem" on your machine and you have ruby installed
Follow these steps:

0. Run bundle to install all required gems

1. Find the "input.txt" file, edit it as per the inputs:
	I have also added one file with error cases as "input2.txt",
	In this file, I am using a sample input added with more test cases:
		Driver Dan
		Driver Alex
		Driver Bob
		Driver Saurav
		Trip Dan 07:15 07:45 17.3
		Trip Dan 06:12 06:32 12.9
		Trip Alex 12:01 13:16 42.0
		Trip Alex 12:01 13:16 40002.0
		Trip Alex 12:01 13:16 1.0

	For the test input on https://gist.github.com/dan-manges/1e1854d0704cb9132b74, use the input file "input.txt" or copy paste the following texts in yourinputfile.txt:
		Driver Dan
		Driver Alex
		Driver Bob
		Trip Dan 07:15 07:45 17.3
		Trip Dan 06:12 06:32 12.9
		Trip Alex 12:01 13:16 42.0

2. 	Run the file filereader.rb in the cmd by the command (runs the whole software):
		ruby filereader.rb input.txt 
    or	ruby filereader.rb input2.txt 
    or	ruby filereader.rb input3.txt 

3.  The tests are in spec folder, I am using rspec
	To run all the tests run: bundle exec rspec spec On cmd

4. The files are in the lib folder, if there is any confusion, please mail me at :sprakash24oct@gmail.com

Thank You! :)





