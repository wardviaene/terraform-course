#!/bin/bash

vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE}`
exit 0
pvcreate ${DEVICE}
vgcreate data ${DEVICE}
lvcreate --name volume1 -l 100%FREE data
mkfs.ext4 /dev/data/volume1
mkdir -p /data
echo '/dev/data/volume /data defaults 0 0' >> /etc/fstab
mount /data
