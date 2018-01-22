 #!/bin/bash

systemctl enable sshguard
systemctl start sshguard
systemctl enable ssh
systemctl start ssh

