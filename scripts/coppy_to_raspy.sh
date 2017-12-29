 #!/bin/bash

rsync -avr -e "ssh -l roman" ~/workspace/Applied-Robotics-Project 192.168.0.105:/home/roman/workspace
