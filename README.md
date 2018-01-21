# Applied-Robotics-Project
This is a project done in the course applied robotics.

 1.  You need to create a folder named workspace in `~/`, for example
			
			mkdir /home/roman/workspace
 2. clone this repo to your computer and to the raspberry pi
	 
		 git clone https://github.com/pasrom/Applied-Robotics-Project.git
		 cd Applied-Robotics-Project
		 cd installScripts
		 
 3. run `install.sh` to automatically install ROS and ORB_SLAM2 with all its dependencies.

		  ./install.sh

	maybe you have to make it executable first

		 chmod +x install.sh
	- on the raspberry pi it will only install ROS and pigpio library and gopigo.

 4. Go grab a :coffee:, but don't forget to press enter :smile:

## Master
Following command is starting ORB_SLAM2, Camera republisher, rviz, roboter pose updater and rqt gui
	   
	   roslaunch fin_starter Master.launch
## Raspberry Pi
ssh into your raspberry pi.

**this has to be done the first time:**
	
	su root
	/home/$user/workspace/Applied-Robotics-Project/installScripts/add_bashrc.sh

Starting the motor and the distance measurement

    su root
    rosrun motor_cpp motor_cpp
open again a ssh to your raspberry pi and start the camera and motor velocities publisher
   
    roslaunch fin_starter raspy.launch
#### IP-Address changing
If you want to change the IP-address of the master you can do it in this [script](https://github.com/pasrom/Applied-Robotics-Project/blob/master/installScripts/setRosIp.sh). Here is the line:

	MASTER_IP=192.168.0.107

## Known Bugs

 **Make sure, that the environment variables are set correctly.**
 
	source /opt/ros/kinetic/setup.bash
	. ~/catkin_ws/devel/setup.bash
	source ~/gopigo_ws/devel/setup.bash
	. ~/workspace/Applied-Robotics-Project/installScripts/setRosIp.sh
	export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/roman/workspace/ORB_SLAM2/Examples/ROS

Important is, that the line `export ROS_PACKAGE_PATH=...` is at the end.

**Changed `~/.bashrc`**
After you added or changed a environment variable in `~/.bashrc` you have to start a new terminal to activate them.

 **Virtual Machine**
If you are using a virtual machine, make sure you turned of the 3D acceleration. Otherwise the ORB_SLAM2 will not work, because Pangoling throws an error.

**not enough memory**
If building is throwing errors, first check if there is enough memory left. If not, run [this](https://github.com/pasrom/Applied-Robotics-Project/blob/master/installScripts/createSwapfile.sh) script.

	sudo ./createSwapfile.sh
