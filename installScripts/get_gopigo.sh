#!/bin/sh

cd ~/
git clone https://github.com/pasrom/gopigo_ws.git

source ~/.bashrc
#
source /opt/ros/kinetic/setup.bash

cd ~/gopigo_ws

catkin_make

