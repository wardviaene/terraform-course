#!/bin/bash

vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE}`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
	pvcreate ${DEVICE}
	vgcreate data ${DEVICE}
	lvcreate --name volume1 -l 100%FREE data
	mkfs.ext4 /dev/data/volume1
fi
mkdir -p /data
echo '/dev/data/volume1 /data ext4 defaults 0 0' >> /etc/fstab
mount /data
