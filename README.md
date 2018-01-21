# Applied-Robotics-Project
This is a project done in the course applied robotics

 1.  You need to create a folder named workspace in ~/, for example
			`mkdir /home/roman/workspace`
 2. clone this repo
 3. run install.sh to automatically install ROS and ORB_SLAM2 with all its dependencies.
	- on the raspberry pi it will only install ROS and pigpio library and gopigo.




	
## Master
Following command is starting ORB_SLAM2, Camera republisher, rviz and rqt gui
   `roslaunch fin_starter Master.launch`

## Raspberry Pi
ssh into your raspberry pi and start the motor

    su root
    rosrun motor_cpp motor_cpp
open again a ssh to your raspberry pi and start the camera and motor velocities publisher
   
    roslaunch fin_starter raspy.launch
