#!/bin/bash
sudo pacman -S avahi --noconfirm --needed
sudo systemctl start avahi-daemon.service
sudo systemctl enable avahi-daemon.service

sudo pacman -S hplip cups gtk3-print-backends --noconfirm --needed
sudo systemctl start org.cups.cupsd.service
sudo systemctl enable org.cups.cupsd.service
firefox http://localhost:631/ &
