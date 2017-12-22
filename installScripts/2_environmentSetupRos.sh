 #!/bin/bash

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
read -rsp $'Press enter to continue...\n'
#
source /opt/ros/kinetic/setup.bash

# create ros workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

echo $ROS_PACKAGE_PATH
read -rsp $'Press enter to continue...\n'

LINE='. ~/catkin_ws/devel/setup.bash'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"