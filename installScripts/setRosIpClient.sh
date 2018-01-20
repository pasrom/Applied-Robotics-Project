#!/bin/bash

IP=$(hostname -I)
MASTER_IP=192.168.0.107

echo "Raspy IP:" $IP
echo "Master IP:" $MASTER_IP
export  ROS_MASTER_URI=http://$MASTER_IP:11311
export ROS_IP=${IP::-1} #onw IP

echo $ROS_MASTER_URI
echo $ROS_IP
