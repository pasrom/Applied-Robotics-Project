 #!/bin/bash

LINE='source ~/gopigo_ws/devel/setup.bash'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

LINE='. ~/workspace/Applied-Robotics-Project/installScripts/setRosIp.sh'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
