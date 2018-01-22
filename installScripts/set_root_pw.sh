 #!/bin/bash

statusRoot="$(sudo passwd --status root)"
echo $statusRoot
if [[ $statusRoot = *"root NP"* ]]; then
	echo "set a root password!"
	sudo passwd
else
	echo "good job, root password is set!"
fi
