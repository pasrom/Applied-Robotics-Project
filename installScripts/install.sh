 #!/bin/bash

function debugging() {
	if [  "$1" = "debug" ]; then
		read -rsp $'Press enter to continue...\n'
	fi
}

architecture="$(dpkg --print-architecture)"
echo Installing on $architecture

# we need a root user for starting the pigpio library
if [  "$architecture" = "armhf" ]; then
	sudo cp ~/.bashrc /root/.bashrc
fi

./1_installRos.sh
echo "finished 1_installRos.sh"
debugging $1

./2_environmentSetupRos.sh
echo "finished 2_environmentSetupRos.sh"
debugging $1

#
if [  "$architecture" = "armhf" ]; then
#
# this steps are only for the raspy
#
	./install_fin.sh
	bash get_fin.sh
	./add_bashrc.sh
	echo "finished pigpio, fin and bashrc"
	debugging $1
	
	./raspi_config.sh
	echo "finished eneabling ssh"
	debugging $1

	./set_root_pw.sh	
else
#
# this steps are only for the master / or other clients not raspy
#	
	bash get_fin.sh
	. /opt/ros/$ROS_DISTRIBUTION/setup.bash
	./add_bashrc.sh
	echo "finished fin and bashrc"
	debugging $1

	./3_eigen.sh
	echo "finished 3_eigen.sh"
	debugging $1

	./4_Pangolin.sh
	echo "finished 4_Pangolin.sh"
	debugging $1

	./5_OpenCV.sh
	echo "finished 5_OpenCV.sh"
	debugging $1

	./6_DBoW2_eigen_g2o_.sh
	echo "finished 6_DBoW2_eigen_g2o_.sh"
	debugging $1

	./7_orb_slam2A.sh
	source ~/.bashrc
	./7_orb_slam2B.sh
	echo "finished 7_orb_slam2.sh"
	debugging $1

#install turtlebot-teleop package
	sudo apt -y install ros-$ROS_DISTRIBUTION-turtlebot3-teleop
	echo "finished turtlebot-teleop"
fi
