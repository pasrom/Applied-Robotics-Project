 #!/bin/bash

LINEA='source /opt/ros/kinetic/setup.bash'
FILE=~/.bashrc
grep -qF "$LINEA" "$FILE" || echo "$LINEA" >> "$FILE"

source ~/.bashrc
#
source /opt/ros/kinetic/setup.bash

# create ros workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

echo $ROS_PACKAGE_PATH

LINE='. ~/catkin_ws/devel/setup.bash'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# install used package 
sudo apt-get install ros-kinetic-video-stream-opencv
sudo apt-get install ros-kinetic-libuvc-camera

# coppy the camera calibration file to the right folder
if [ "$1" = "fisheye" ]; then
	nameCamera="camera_fisheye.yaml"
else
	nameCamera="camera_logitech.yaml"
fi

mkdir ~/.ros/camera_info
cp ~/workspace/Applied-Robotics-Project/camera_calibration_files/$nameCamera ~/.ros/camera_info/camera.yaml

# this is for the camera streamer
sudo echo SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="05a3", ATTRS{idProduct}=="9230", MODE="0666" > /etc/udev/rules.d/99-uvc.rules
