#!/bin/bash
sudo pacman -S samba gvfs-smb --noconfirm --needed
cd
mkdir samba
sudo cp /etc/samba/smb.conf.default /etc/samba/smb.conf
sudo smbpasswd -a $USER
echo "
[samba]
path = /home/$USER/samba
available = yes
browsable = yes
guest ok = yes
public = yes
writable = yes
workgroup = WORKGROUP
force user = $USER
force group = $USER
admin users = $USER
" | sudo tee --append /etc/samba/smb.conf
sudo systemctl enable smbd nmbd
