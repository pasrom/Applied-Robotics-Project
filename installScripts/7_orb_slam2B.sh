 #!/bin/bash

cd ~/workspace/ORB_SLAM2
chmod +x build_ros.sh
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/workspace/ORB_SLAM2/Examples/ROS
bash ./build_ros.sh
