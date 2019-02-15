#########################################################################
# File Name: nfs.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Thu 14 Feb 2019 01:03:36 AM PST
# Version : 1.0
#########################################################################
#!/bin/bash

# sudo 或者 root
[ `whoami` != root ] && echo sudo $0 username && exit 1

[ $# -ne 1 ] && echo sudo $0 username && exit 4

USERNAME=$1

S_PATH=`pwd`


mkdir /home/${USERNAME}/vexpress-platform
cd /home/${USERNAME}/vexpress-platform


# qemu
apt-get install zlib1g-dev libglib2.0-0 libglib2.0-dev libglib2.0-0 libglib2.0-dev libpixman-1-dev libfdt-dev -y
#apt-get install qemu-system-arm -y
apt-get install qemu-system -y
#git clone git://git.qemu-project.org/qemu.git
#cd qemu && git checkout v2.7.0
#./configure --target-list=arm-softmmu --audio-drv-list=
#make && make install

# arm-gcc
apt-get install gcc-arm-linux-gnueabi -y

# bridge
apt-get install uml-utilities bridge-utils -y

[ -f /etc/qemu-ifup ] || cp ${S_PATH}/qemu-ifup /etc/qemu-ifup && chmod +x /etc/qemu-ifup
[ -f /etc/qemu-ifdown ] || cp ${S_PATH}/qemu-ifdown /etc/qemu-ifdown && chmod +x /etc/qemu-ifup

# network
cat >> /etc/network/interfaces <<ipipopopopqru23
auto ens33
auto br0
iface br0 inet dhcp
    bridge_ports ens33
ipipopopopqru23
/etc/init.d/networking restart

# nfs
apt-get install nfs-kernel-server -y
echo "/home/${USERNAME}/vexpress-platform/busybox/rootfs *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
/etc/init.d/rpcbind restart
/etc/init.d/nfs-kernel-server restart

#tftp
cd /home/${USERNAME}/vexpress-platform
mkdir tftpboot
chmod 777 tftpboot

sed -i '/^TFTP_DIRECTORY/d' /etc/default/tftpd-hpa
echo "TFTP_DIRECTORY=\"/home/${USERNAME}/vexpress-platform/tftpboot\"" >> /etc/default/tftpd-hpa
sudo service tftpd-hpa restart




su - ${USERNAME} -c git clone git@github.com:lisider/arm_vexpress_code.git
su - ${USERNAME} -c git clone git@github.com:lisider/open_source.git
su - ${USERNAME} -c git clone git@github.com:lisider/linux_4.0.git
su - ${USERNAME} -c git clone git@github.com:lisider/busybox.git


#su - ${USERNAME} -c build.sh
