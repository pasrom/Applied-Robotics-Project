 #!/bin/bash

# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Installation
sudo apt-get update

read -rsp $'Press enter to continue...\n'

sudo apt-get -y install ros-kinetic-desktop-full

read -rsp $'Press enter to continue...\n'

# Initialize rosdep
sudo rosdep init
rosdep update

# Dependencies for building packages
sudo apt-get -y install python-rosinstall python-rosinstall-generator python-wstool build-essential
