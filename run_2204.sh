#########################################################################
# File Name: ./run_2204.sh
# Author: SuWeishuai
# mail: suwsl@foxmail.com
# Created Time: Sat 25 Mar 2023 07:33:14 PM CST
# Version : 1.0
#########################################################################
#!/bin/bash
sudo qemu-system-arm \
    -M vexpress-a9 \
    -m 512M  \
    -kernel ../u-boot/u-boot \
    -nographic   \
    \
    -net nic \
    -net tap,ifname=tap0
