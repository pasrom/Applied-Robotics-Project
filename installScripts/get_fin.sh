#!/bin/sh

cd ~/
git clone https://github.com/pasrom/fin_ws.git fin_ws

sudo apt-get install ros-$ROS_DISTRIBUTION-ackermann-msgs -y

source ~/.bashrc
#
source /opt/ros/$ROS_DISTRIBUTION/setup.bash

cd ~/fin_ws

catkin_make

