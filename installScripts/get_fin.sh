#!/bin/sh

cd ~/
git clone https://github.com/pasrom/fin_ws.git fin_ws

source ~/.bashrc
#
source /opt/ros/kinetic/setup.bash

cd ~/fin_ws

catkin_make

