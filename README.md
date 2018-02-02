
# Applied-Robotics-Project
This is a project done in the course applied robotics. It's about a mobile roboter, which has a mounted camera on it. This camera is used to slam with [ORB_SLAM2](https://github.com/pasrom/ORB_SLAM2) . The roboter is controlled by a differential drive and has a distance measurement, which is used for speed and pose determination. [ROS](http://www.ros.org)-Kinetic is used to bring all parts together. It is testet with Ubuntu Mate 16.04.2 LTS, both at the master and at the raspberry pi.

This project debends on [ORB_SLAM2](https://github.com/pasrom/ORB_SLAM2) and [fin_ws](https://github.com/pasrom/fin_ws). The following manual will lead you trough the installation procedure.

# Installation procedure

Run this procedure at the master computer and also at the raspberry pi. On the raspberry pi it will only install ROS and pigpio library and gopigo. The standard password we used was 
```
fhv
```

 1. Maybe you need to install git first
	```
	sudo apt-get update && sudo apt install git
	```
 2.  You need to create a folder named workspace in `~/`, for example
		```
		mkdir ~/workspace
		```
 4. clone this repo to your computer and to the raspberry pi
	```
	cd ~/workspace
	git clone https://github.com/pasrom/Applied-Robotics-Project.git
	cd Applied-Robotics-Project/installScripts
	```
 5. run `install.sh` to automatically install ROS and ORB_SLAM2 with all its dependencies.
	```
	./install.sh
	```
	maybe you have to make it executable first
	```
	chmod +x install.sh
	```
 6. Go grab :coffee: :coffee: :coffee: ...

# Starting the publishers and subscribers
## Master
First start the roscore
```
roscore
```
Following command is starting ORB_SLAM2, Camera republisher, rviz, roboter pose updater, map creator and rqt gui
```   
roslaunch fin_starter Master.launch
```
### Starting each package by hand
	
```
rosrun image_transport republish compressed in:=/camera/image_raw raw out:=/camera/camera_eigen
rosrun ORB_SLAM2 Mono Vocabulary/ORBvoc.txt Examples/Monocular/Logitech640x480.yaml
rosrun ORB_SLAM2 Monosub2 20 1 10 -15 20 -10 0.55 0.50 1 5 0 0 1 75
roslaunch nav_behaviors nav_behaviors.launch
roslaunch fin_description fin_rviz.launch
```

## Raspberry Pi
ssh into your raspberry pi. If you use two raspberry pi's, one for motor control and one for camera streaming, open for each a seperate ssh.
```
ssh raspy@192.168.0.105
ssh raspy@192.168.0.106
```
**This has to be done the first time:**
	
   `$user` is your username, created at the raspberry pi. Also make sure, that therre is only **one** username, otherwise the script may fail.
```
su root
/home/$user/workspace/Applied-Robotics-Project/installScripts/add_bashrc.sh
```
----------


Starting the motor, the distance measurement and motor velocities publisher
```
su root
roslaunch fin_starter raspyMotor.launch
```
open again a ssh to your second raspberry pi and start the camera
starting fisheye camera:
```
su root
roslaunch fin_starter raspyCamFisheye.launch 
```
starting normal camera:
```
roslaunch fin_starter raspyCam.launch 
```

#### IP-Address changing
If you want to change the IP-address of the master you can do it in this [script](https://github.com/pasrom/Applied-Robotics-Project/blob/master/installScripts/setRosIp.sh). Here is the line:
```
MASTER_IP=192.168.0.107
```

### Starting each package by hand

```
roslaunch video_stream_opencv camera.launch
roslaunch fin_description fin_interface.launch 
```

## Known Bugs

 **Make sure, that the environment variables are set correctly.**
 
 Your `~/.bashrc` should look similar like this (scrol to the end of the file):
```
source /opt/ros/kinetic/setup.bash
. ~/catkin_ws/devel/setup.bash
source ~/gopigo_ws/devel/setup.bash
. ~/workspace/Applied-Robotics-Project/installScripts/setRosIp.sh
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/roman/workspace/ORB_SLAM2/Examples/ROS
```

Important is, that the line `export ROS_PACKAGE_PATH=...` is at the end.

**Changed `~/.bashrc`**


After you added or changed a environment variable in `~/.bashrc` you have to start a new terminal to activate them.


 **Virtual Machine**
 
If you are using a virtual machine, make sure you turned of the 3D acceleration. Otherwise the ORB_SLAM2 will not work, because Pangoling throws an error.

**Not enough memory**


If building is throwing errors, first check if there is enough memory left. If not, run [this](https://github.com/pasrom/Applied-Robotics-Project/blob/master/installScripts/createSwapfile.sh) script.
```
sudo ./createSwapfile.sh
```

**Camera starting throws error**

Unplug and plug in the usb camera connector.

**Not on this list**

Please feel free to open an [issue](https://github.com/pasrom/Applied-Robotics-Project/issues/new).

# Installation Guide for Raspberry Pi
## Preparing the SD Card
This is a quick start guide to install the raspberry pi image on a SD card (mac).

	sudo diskutil list

search for the `/dev/diskX` entry

```
sudo diskutil unmountDisk /dev/disk2
sudo ddrescue -c 1Ki -v --force ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img /dev/rdisk2
```

Backup your SD with `ddrescue`

```
sudo ddrescue -c 1Ki -v --force /dev/rdisk2 ubuntu-mate-16.04.2_ROS.img
```

## Raspberry Pi startup

 1. Follow the instructions given on the screen
 2. Connect to the wifi
 3. At the dialog indow "Who are you"
	 check the following
	- [x] Log in automatically
	- [ ] Require my password to log in
 4. Reboot

# Steering the roboter with a Logitech Controller

With the Logitech Controller it is possible to send a twist message to the roboter. With the left **joystick** you steer the roboter, but you have to press the **LB** Button during steering. The **LB** Button also resets the trajectory, this means the controller has higer priority than the trajectory. The **RB** Button will reset the ORB SLAM2, the odometry of the roboter and also the scale factor of the published ORB SLAM2 messages.

![Logitech Controller](https://www.logitechg.com/assets/47832/9/f310-gaming-gamepad-images.png)

# Camera Calibration

To calibrate the camera follow this [link](http://wiki.ros.org/camera_calibration/Tutorials/MonocularCalibration) and this [link](http://wiki.ros.org/camera_calibration/Tutorials/StereoCalibration) for stereo calibration.
It is good to calibrate the camera at the laptop or computer and **NOT** at the raspberry pi, because it is slow.
For the ORB SLAM2 there is one more step to do. You have to extract following values out of the `camera.yaml` file after calibration .
```
camera_matrix:
fx 0 cx
0 fy cy
0 0 1

distortion_coefficients:
d0 d1 d2 d3 0

.........
```
and insert these values in the `Logitech640x480.yaml` file located at `/ORB_SLAM2/Examples/Monocular/Logitech640x480.yaml`
```
%YAML:1.0

#--------------------------------------------------------------------------------------------
# Camera Parameters. Adjust them!
#--------------------------------------------------------------------------------------------

# Camera calibration and distortion parameters (OpenCV) 
Camera.fx: fx
Camera.fy: fy
Camera.cx: cx
Camera.cy: cy

Camera.k1: d0
Camera.k2: d1
Camera.p1: d2
Camera.p2: d3
Camera.k3: 0.0

.........
```

# Fishe Eye Camera
If you are using another fisheye camera with [libuvc-camera](http://wiki.ros.org/libuvc_camera) you have to change two parameters in [this](https://github.com/pasrom/Applied-Robotics-Project/blob/9f0ce0b9605aa4ef1c9ed327676b5f6002fffc97/installScripts/2_environmentSetupRos.sh#L37) script. The `idVendor` and `idProduct` has to be changed (without the hex notation).
```
sudo echo SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="05a3", ATTRS{idProduct}=="9230", MODE="0666" > /etc/udev/rules.d/99-uvc.rules
```

 The `idVendor` and `idProduct` values you will get with the following command
```
lsusb -v
```
Search for your camera, coppy and paste the mentioned parameters.
# Getting startet with ROS

Follow this [link](http://wiki.ros.org/ROS/Tutorials) and you will be happy to start with ROS.