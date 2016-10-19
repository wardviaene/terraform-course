#!/bin/bash

vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE}`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
	pvcreate ${DEVICE}
	vgcreate data ${DEVICE}
	lvcreate --name volume1 -l 100%FREE data
	mkfs.ext4 /dev/data/volume1
fi
mkdir -p /var/lib/jenkins
echo '/dev/data/volume1 /var/lib/jenkins ext4 defaults 0 0' >> /etc/fstab
mount /var/lib/jenkins

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update
apt-get install -y jenkins=${JENKINS_VERSION}
