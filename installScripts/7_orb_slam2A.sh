 #!/bin/bash

./createSwapfile.sh

echo "install ORB SLAM2"
cd ~/workspace
#git clone https://github.com/raulmur/ORB_SLAM2.git ORB_SLAM2
git clone https://github.com/pasrom/ORB_SLAM2.git ORB_SLAM2

cd ORB_SLAM2
chmod +x build.sh
./build.sh

LINE='export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/workspace/ORB_SLAM2/Examples/ROS'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

