 #!/bin/bash


sudo swapoff /swapfile 

# create swap file
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo "install ORB SLAM2"
cd ~/workspace
git clone https://github.com/raulmur/ORB_SLAM2.git ORB_SLAM2

cd ORB_SLAM2
chmod +x build.sh
./build.sh

LINE='export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/workspace/ORB_SLAM2/Examples/ROS'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/workspace/ORB_SLAM2/Examples/ROS

chmod +x build_ros.sh
bash ./build_ros.sh