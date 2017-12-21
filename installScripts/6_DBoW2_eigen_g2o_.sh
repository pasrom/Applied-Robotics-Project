 #!/bin/bash

echo "install libboost-dev"
sudo apt-get -y install libboost-dev


echo "get DBoW2"
cd ~/workspace
git clone https://github.com/dorian3d/DBoW2.git
cd DBoW2
mkdir build
cd build
cmake ..
make
sudo make install

# eigen
echo "install eigen"
sudo apt -y install libeigen3-dev

#g2o
echo "install g2o"
cd ~/workspace
sudo apt-get -y install - libsuitesparse-dev - qtdeclarative5-dev - qt5-qmake - libqglviewer-dev
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
mkdir build
cd build
cmake ../
make
