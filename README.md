# learn_ruby
Toy robot simulator(robot.rb)

Description:
  - The application is a simulator of the movement of a toy robot on a rectangular table with dimensions of X x Y cells. If the size is not specified, set the size to 5x6 cells.
  - There are no more obstacles on the table.
  - The robot can move freely on the table, but it must be avoided from falling off the table. Any command that would cause the robot to fall off the table must be prevented (bypassed), but any subsequent commands that do not cause the robot to fall must be executed.

Technical side: 
- Create an application that reads commands of the following form:
   PLACE X,Y,F
   MOVE
   LEFT
   RIGHT
   REPORT

- The size of the table is set when the application is initialized
- PLACE will set the position of the robot on the table with cell coordinates (X, Y) and the direction in which the robot will look (F)
- NORTH, SOUTH, EAST or WEST - Cell with coordinates 0,0 must be regarded as the extreme southwestern corner (SOUTH WEST)
- The very first valid command for the robot should be the PLACE command. The application must reject all commands in the sequence until the PLACE command is executed
- MOVE - to move the robot one cell forward in the direction it is currently facing.
- LEFT and RIGHT - will rotate the robot 90 degrees in the corresponding direction without changing its position
- REPORT - will display the current coordinates of the robot (X, Y) and its current direction (F). The output can be in any form.
- A robot that is not on the table must ignore the MOVE, LEFT, RIGHT and REPORT commands
- Data input can be either from a file or from the command line (your choice)
- The developer must provide test data for verification. Limitations:
- The robot must not fall off the table while moving. This also includes the robot's starting position.
- Any command that causes the robot to fall must be ignored

Examples Input/Output:
а)
PLACE 0,0,NORTH
MOVE
REPORT
->Output: 0,1,NORTH

б)
PLACE 0,0,NORTH
LEFT
REPORT
->Output: 0,0,WEST

в)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
->Output: 3,3,NORTH

CLI(command line interface)

=========================================

soccer_exercise.rb

The Problem
We want you to create a command-line application that will calculate the ranking table for a soccer league.

Input/output
The input and output will be text. Your solution should parse the provided sample input file via stdin (pipe or redirect) or by parsing a file passed by name on the command line. Your solution should output the correct result via stdout to the console.

The input contains results of games, one per line. See sample input for details. The output should be ordered from most to least points, following the format specified in expected output.

You can expect that the input will be well-formed. There is no need to add special handling for malformed input files.

The rules
In this league, a draw (tie) is worth 1 point and a win is worth 3 points. A loss is worth 0 points. If two or more teams have the same number of points, they should have the same rank and be printed in alphabetical order (as in the tie for 3rd place in the sample data).

Guidelines
This should be implemented in ruby.

Your solution should be able to be run from the command line. Please include appropriate scripts and instructions for running your application and your tests.

If you use other libraries installed by rubygems/bundler it is not necessary to commit the installed packages.

Write automated tests.

Appreciated well factored, object-oriented or functional designs.

Input sample
Lions 3, Snakes 3
Tarantulas 1, FC Awesome 0
Lions 1, FC Awesome 1
Tarantulas 3, Snakes 1
Lions 4, Grouches 0

Expected output
Tarantulas, 6 pts
Lions, 5 pts
FC Awesome, 1 pt
Snakes, 1 pt
Grouches, 0 pts
