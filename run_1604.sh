#########################################################################
# File Name: test.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Sun 07 Oct 2018 06:54:51 PM PDT
# Version : 1.0
#########################################################################
#!/bin/bash
sudo qemu-system-arm \
    -M vexpress-a9 \
    -m 512M \
    -kernel ../u-boot/u-boot \
    -nographic \
    -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 \
    #-S -s
#-append "root=/dev/mmcblk0 rw console=ttyAMA0" -sd rootfs.ext3
