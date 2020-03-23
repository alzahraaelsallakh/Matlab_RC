# Matlab_RC
 Simple car with options of being remotely controlled through GUI or following line.
 
 ## The required operations are:
 1) Manual control through GUI buttons
 2) Line follower
 
 The project is implemented using `Arduino simulink library` and figure based GUI using `MATLAB App Guide`
 
 The main script and the project entry is "chooseMode" which has 2 buttons, one for each operation as follow
 
 <p align="center">
  <img  src="../media/main menu.PNG?raw=true">
</p>
 
The manual control mode:
 <p align="center">
  <img  src="../media/manual control.PNG?raw=true">
</p>

The line follower mode:
 <p align="center">
  <img  src="../media/line follower.PNG?raw=true">
</p>

## Hardware connections:
1) Forward right motor -> pin 10
2) Backward right motor -> pin 11
3) Forward left motor -> pin 8
4) Backward left motor -> pin 9
5) Right IR -> pin 3
6) Left IR -> pin 4
7) Center IR -> pin 5
