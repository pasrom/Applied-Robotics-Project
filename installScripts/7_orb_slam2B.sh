 #!/bin/bash

cd ~/workspace/ORB_SLAM2
chmod +x build_ros.sh
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/workspace/ORB_SLAM2/Examples/ROS
bash ./build_ros.sh

# create symbolic link
mkdir ~/workspace/ORB_SLAM2/Examples/ROS/ORB_SLAM2/src/scripts
ln -s ~/workspace/ORB_SLAM2/Examples/Monocular/Logitech640x480.yaml ~/workspace/ORB_SLAM2/Examples/ROS/ORB_SLAM2/src/scripts/Logitech640x480.yaml
ln -s ~/workspace/ORB_SLAM2/Vocabulary/ORBvoc.txt ~/workspace/ORB_SLAM2/Examples/ROS/ORB_SLAM2/src/scripts/ORBvoc.txt
