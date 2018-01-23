#!/bin/bash

IP=$(hostname -I)

architecture="$(dpkg --print-architecture)"
echo $architecture
if [  "$architecture" = "armhf" ] || [ "$1" != "" ] ; then
	echo raspy
	if [ $IP = *"192.168."* ]; then
    	MASTER_IP=192.168.0.107
    else
    	MASTER_IP=172.21.200.130
    fi

	export ROS_MASTER_URI=http://$MASTER_IP:11311
	export ROS_IP=${IP::-1} #onw IP
else
	echo master
	export ROS_MASTER_URI=http://${IP::-1}:11311
	export ROS_IP=${IP::-1} #onw IP
fi

echo $ROS_MASTER_URI
echo $ROS_IP




