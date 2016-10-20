#!/usr/bin/env bash

##### Mount disks

# Install LVM software:
yum -y install lvm2 dmsetup mdadm reiserfsprogs xfsprogs

# Create disk partitions for LVM:
pvcreate /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1

# Create volume group upon disk partitions:
vgcreate vg-nvme /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1
lvcreate --name lv --size 11.6T vg-nvme
mkfs.ext4 /dev/vg-nvme/lv
mkdir /mnt/data1
mount /dev/vg-nvme/lv /mnt/data1
chmod 777 /mnt/data1
