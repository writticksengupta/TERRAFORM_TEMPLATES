#login to the linux machine.you will find an ebs volume inside already(persistent)
#create file system in ebs volume
mkfs.ext4 /dev/xvdh
#create a directory
mkdir /data
mount /dev/xvdh /data
#now you have created a filesystem and mounted it on the data directory. its will still get deleted once you terminate the instance.
vim /etc/fstab
/dev/xvdh / data ext4 defaults 0 0
#man fstab
