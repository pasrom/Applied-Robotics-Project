 #!/bin/bash
architecture="$(dpkg --print-architecture)"
echo Installing on $architecture

./1_installRos.sh
echo "finished 1_installRos.sh"
if [  "$1" = "debug" ]; then
	read -rsp $'Press enter to continue...\n'
fi

./2_environmentSetupRos.sh
echo "finished 2_environmentSetupRos.sh"
if [  "$1" = "debug" ]; then
	read -rsp $'Press enter to continue...\n'
fi

#
if [  "$architecture" = "armfh" ]; then
#
# this steps are only for the raspy
#
	./install_pigpio.sh
	bash get_gopigo.sh
	./add_bashrc.sh
	echo "finished pigpio, gopigo and bashrc"
	if [  "$1" = "debug" ]; then
	read -rsp $'Press enter to continue...\n'
	fi
else
#
# this steps are only for the master / or other clients not raspy
#	
	bash get_gopigo.sh
	. /opt/ros/kinetic/setup.bash
	./add_bashrc.sh
	echo "finished gopigo and bashrc"
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi

	./3_eigen.sh
	echo "finished 3_eigen.sh"
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi

	./4_Pangolin.sh
	echo "finished 4_Pangolin.sh"
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi

	./5_OpenCV.sh
	echo "finished 5_OpenCV.sh"
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi

	./6_DBoW2_eigen_g2o_.sh
	echo "finished 6_DBoW2_eigen_g2o_.sh"
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi

	./7_orb_slam2A.sh
	source ~/.bashrc
	./7_orb_slam2B.sh
	echo "finished 7_orb_slam2.sh"
	if [  "$1" = "debug" ]; then	
		read -rsp $'Press enter to continue...\n'
	fi
fi
