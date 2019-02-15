#########################################################################
# File Name: 1.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Fri 15 Feb 2019 01:30:42 AM PST
# Version : 1.0
#########################################################################
#!/bin/bash
# ubuntu 图形界面

sudo apt-get install openssh-server


# secure CRT


sudo apt install lrzsz 

rz sources.list-1604

sudo cp sources.list-1604  /etc/apt/sources.list

sudo apt-get update


# pop home

sudo apt-get install expect curl -y
sudo su -
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/config_home/master/.config/vectors.sh)" pop
