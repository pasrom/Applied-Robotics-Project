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

# coppy the camera calibration file to the right folder
if [ "$1" = "fisheye" ]; then
	nameCamera="camera_fisheye.yaml"
else
	nameCamera="camera_logitech.yaml"
fi
cp ~/workspace/Applied-Robotics-Project/camera_calibration_files/$nameCamera ~/.ros/camera_info/camera.yaml
