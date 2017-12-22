 #!/bin/bash

./1_installRos.sh
echo "finished 1_installRos.sh"
read -rsp $'Press enter to continue...\n'
./2_environmentSetupRos.sh
echo "finished 2_environmentSetupRos.sh"
read -rsp $'Press enter to continue...\n'
./3_eigen.sh
echo "finished 3_eigen.sh"
read -rsp $'Press enter to continue...\n'
./4_Pangolin.sh
echo "finished 4_Pangolin.sh"
read -rsp $'Press enter to continue...\n'
./5_OpenCV.sh
echo "finished 5_OpenCV.sh"
read -rsp $'Press enter to continue...\n'
./6_DBoW2_eigen_g2o_.sh
echo "finished 6_DBoW2_eigen_g2o_.sh"
read -rsp $'Press enter to continue...\n'
bash -c './7_orb_slam2.sh ; bash '
echo "finished 7_orb_slam2.sh"
read -rsp $'Press enter to continue...\n'