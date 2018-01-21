 #!/bin/bash
architecture="$(dpkg --print-architecture)"
echo Installing on $architecture

./1_installRos.sh
echo "finished 1_installRos.sh"
read -rsp $'Press enter to continue...\n'
./2_environmentSetupRos.sh
echo "finished 2_environmentSetupRos.sh"
read -rsp $'Press enter to continue...\n'

#
if [  "$architecture" = "armfh" ]; then
#
# this steps are only for the raspy
#
	./install_pigpio.sh
	./get_gopigo.sh
	./add_bashrc.sh
	echo "finished pigpio, gopigo and bashrc"
	read -rsp $'Press enter to continue...\n'
else
#
# this steps are only for the master / or other clients not raspy
#	
	./get_gopigo.sh
	. /opt/ros/kinetic/setup.bash
	./add_bashrc.sh
	echo "finished gopigo and bashrc"
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
	./7_orb_slam2A.sh
	source ~/.bashrc
	./7_orb_slam2B.sh
	#bash -c './7_orb_slam2.sh ; bash '
	echo "finished 7_orb_slam2.sh"
	read -rsp $'Press enter to continue...\n'
fi
