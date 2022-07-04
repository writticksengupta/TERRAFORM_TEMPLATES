#(bash script)
#!/bin/bash 
#refresh lvm state nd looks if there are lvm states available
vgchange -ay

#checks if there are file system and outputs it. if not then goes to next line to format it 
DEVICE_FS='blkid -o value -s TYPE $(DEVICE)'
if [ "'echo -n $DEVICE_FS'" == ] ; then
#format file system using userdata 
  pvcreate ${DEVICE} #create /dev
  vgcreate data ${DEVICE} #create /data
  lv create --name volume1 -l 100%FREE data #create /volume
  mkfs.ext4 /dev/data/volume1
  fi 
  mkdir -p /data #-p if it already exists,dont do anything
  echo '/dev/data/volume1 /data ext4 defaults 0 0' >> /etc/fstab
  mount /data
