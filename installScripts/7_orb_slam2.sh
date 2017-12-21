 #!/bin/bash

# create swap file
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
#sudo swapon /swapfile

sudo swapon /swapfile

sudo mkswap /swapfile

echo "install ORB SLAM2"
git clone https://github.com/raulmur/ORB_SLAM2.git ORB_SLAM2

cd ORB_SLAM2
chmod +x build.sh
./build.sh

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/workspace/ORB_SLAM2/Examples/ROS
chmod +x build_ros.sh
./build_ros.sh
