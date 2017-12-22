#!/bin/bash

IP=$(hostname -I)

echo "Master IP:" $IP
export ROS_MASTER_URI=http://${IP::-1}:11311
export ROS_IP=${IP::-1} #onw IP
