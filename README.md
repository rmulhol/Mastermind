#Mastermind
Code-breaking game built with TDD in Ruby

##Purpose
The purpose of Mastermind is to crack a secret code. In this version, you create a secret code, and the computer figures it out.
The computer's method for cracking the secret code is borrowed from Donald Knuth's "The Computer as Mastermind"

##How to Play
To play the game, navigate to the lib directory and enter `ruby runner.rb` in the command line.

##Game Rules
####Begin: Create A Secret Code
When you start the game, you will be offered instructions to think up a secret code. 
Your code should be 4 elements long, where each element is drawn from the following: colors red, blue, green, yellow, purple, and orange.
Repeats are allowed. For example, ["red", "red", "red", "red"] is a valid secret code.

####Continue: Offer Feedback
After the computer offers its first guess, you will be prompted to offer feedback.
First, you will be asked how many picks are the correct color and in the correct position.
This feedback is offered in the Mastermind board game through the placement of black pegs.
Second, you will be asked how many picks are the correct color but in the incorrect position.
This feedback is offered in the board game with white pegs.
Importantly, each element in the computer's guess can only correlate with one element in
your secret code.

######An Example
If your secret code is ["red", "red", "blue", "blue"], and the computer guesses ["red", "blue", "blue", "blue"], 
you should indicate 3 black pegs (1 for the shared "red" at index 0, and 1 for the shared "blue" at index 3) and
0 white pegs. **Note**: Even though the remaining unaccounted element of the computer's guess is "blue", you
do not indicate that this is a yellow peg, since both "blue" elements from your secret code have already been
correctly counted.

##Versions
These files were produced using Ruby 2.1.2 and Rspec 3.1.3

##How to Test
To run all of the tests, navigate to the project directory and enter `rspec` in the command line.
To run an individual test, navigate to the project directory and enter `rspec [spec path]` in the command line.
