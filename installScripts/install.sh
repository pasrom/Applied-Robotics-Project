 #!/bin/bash

function debuging() {
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi
}

architecture="$(dpkg --print-architecture)"
echo Installing on $architecture

./1_installRos.sh
echo "finished 1_installRos.sh"
debuging $1

./2_environmentSetupRos.sh
echo "finished 2_environmentSetupRos.sh"
debuging $1

#
if [  "$architecture" = "armfh" ]; then
#
# this steps are only for the raspy
#
	./install_pigpio.sh
	bash get_gopigo.sh
	./add_bashrc.sh
	echo "finished pigpio, gopigo and bashrc"
	debuging $1
else
#
# this steps are only for the master / or other clients not raspy
#	
	bash get_gopigo.sh
	. /opt/ros/kinetic/setup.bash
	./add_bashrc.sh
	echo "finished gopigo and bashrc"
	debuging $1

	./3_eigen.sh
	echo "finished 3_eigen.sh"
	debuging $1

	./4_Pangolin.sh
	echo "finished 4_Pangolin.sh"
	debuging $1

	./5_OpenCV.sh
	echo "finished 5_OpenCV.sh"
	debuging $1

	./6_DBoW2_eigen_g2o_.sh
	echo "finished 6_DBoW2_eigen_g2o_.sh"
	debuging $1

	./7_orb_slam2A.sh
	source ~/.bashrc
	./7_orb_slam2B.sh
	echo "finished 7_orb_slam2.sh"
	debuging $1
fi
