 #!/bin/bash

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
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
