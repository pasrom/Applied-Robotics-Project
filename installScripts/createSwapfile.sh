# delete swapfile if one /swapfile exists
sudo swapoff /swapfile 
# create swap file
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
