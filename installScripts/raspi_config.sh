 #!/bin/bash

sudo systemctl enable sshguard
sudo systemctl start sshguard
sudo systemctl enable ssh
sudo systemctl start ssh

