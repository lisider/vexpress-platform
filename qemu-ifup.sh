#! /bin/sh
switch=br0
ifconfig $1 up 
 #ip link set $1 up
brctl addif ${switch} $1