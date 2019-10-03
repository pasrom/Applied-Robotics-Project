 #!/bin/bash

# https://www.howtoinstall.co/en/ubuntu/xenial/libglew-dev
sudo apt-get -y install libglew-dev
sudo apt-get -y install libpython2.7-dev
# https://github.com/stevenlovegrove/Pangolin
sudo apt-get -y install ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev
sudo apt-get -y install libdc1394-22-dev libraw1394-dev

sudo apt-get -y install libjpeg-dev libpng-dev libtiff5-dev libopenexr-dev
sudo apt-get -y install doxygen

#building
cd ~/workspace
git clone https://github.com/stevenlovegrove/Pangolin.git

cd Pangolin
# the latest commit gives an built 6f45f8f error
git checkout 7ea6e53
mkdir build
cd build
cmake ..
cmake --build .
# --target doc
