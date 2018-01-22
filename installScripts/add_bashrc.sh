 #!/bin/bash

standardUser="$(ls /home)"

if [  "$USER" != "root" ]; then
LINEA='source ~/gopigo_ws/devel/setup.bash'
FILE=~/.bashrc
grep -qF "$LINEA" "$FILE" || echo "$LINEA" >> "$FILE"

LINEB='. ~/workspace/Applied-Robotics-Project/installScripts/setRosIp.sh'
FILE=~/.bashrc
grep -qF "$LINEB" "$FILE" || echo "$LINEB" >> "$FILE"
fi


if [  "$USER" = "root" ]; then
FILE=~root/.bashrc
LINEC="source /opt/ros/kinetic/setup.bash"
grep -qF "$LINEC" "$FILE" || echo "$LINEC" >> "$FILE"
LINED=". /home/$standardUser/catkin_ws/devel/setup.bash"
grep -qF "$LINED" "$FILE" || echo "$LINED" >> "$FILE"
LINEA="source /home/$standardUser/gopigo_ws/devel/setup.bash"
grep -qF "$LINEA" "$FILE" || echo "$LINEA" >> "$FILE"
LINEB=". /home/$standardUser/workspace/Applied-Robotics-Project/installScripts/setRosIp.sh"
grep -qF "$LINEB" "$FILE" || echo "$LINEB" >> "$FILE"
fi
