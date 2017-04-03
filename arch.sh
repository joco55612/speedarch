#!/bin/bash

# doc: https://google.com/ search arch+COMMAND

HOST="host"
USER="user"
USERPASS="a"
USERGROUP="user"
ROOTPASS="a"
DRIVE="/dev/sda"
BOOT="/dev/sda1"
ROOT="/dev/sda2"

SERVER="https://raw.githubusercontent.com/joco55612/speedarch/master"
sed -i "1 i\Server = $SERVER\/pkg" /etc/pacman.d/mirrorlist

ls /sys/firmware/efi/efivars
dd if=/dev/zero of=$DRIVE bs=4096 count=35
dd if=/dev/zero of=$DRIVE bs=4096 count=35 seek=$(($(blockdev --getsz /dev/sda)*512/4096 - 35))
gdisk $DRIVE <<GDISK
o
Y
n
1

+512MiB
EF00
n
2


8e00
w
Y
GDISK
fdisk -l

vgcreate volgroup0 $ROOT
lvcreate -l 100%FREE volgroup0 -n lv_root
modprobe dm_mod
vgscan
vgchange -ay
mkfs.fat -F32 $BOOT
mkfs.ext4 /dev/volgroup0/lv_root
mount /dev/volgroup0/lv_root /mnt
mkdir /mnt/boot
mount "$BOOT" /mnt/boot


(echo  #select all package from base
echo  # to install all
echo  Y)| pacstrap -i /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash <<CHROOT
pacman -S intel-ucode --noconfirm
bootctl --path=/boot install
cd /boot/loader/
rm -rf loader.conf
echo "timeout 0
default arch
editor 0" >> loader.conf
cat loader.conf
echo "title          Arch Linux
linux          /vmlinuz-linux
initrd         /intel-ucode.img
initrd         /initramfs-linux.img
options        root=/dev/mapper/volgroup0-lv_root quiet rw" >> entries/arch.conf
cat entries/arch.conf

sed -i "s/block filesystems/block lvm2 filesystems/g" /etc/mkinitcpio.conf
mkinitcpio -p linux

hostnamectl set-hostname $HOST
echo "root:$ROOTPASS" | chpasswd
groupadd $USER
useradd -g $USERGROUP -m $USER -d /home/$USER/ -s /bin/bash
echo "$USER:$USERPASS" | chpasswd
pacman -S sudo --noconfirm
echo "$USER        ALL=(ALL)      ALL" >> /etc/sudoers

mkdir "/etc/systemd/system/getty@tty1.service.d"
cd "/etc/systemd/system/getty@tty1.service.d"
echo "[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I $TERM
" | tee --append override.conf

systemctl enable dhcpcd
echo "KEYMAP=us" > /etc/vconsole.conf
sed -i "s/#en_US.UTF-8/en_US.UTF-8/g" /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
CHROOT
timedatectl set-ntp true
hwclock --systohc

echo "-- reboot --" && read a
umount -R /mnt
reboot
