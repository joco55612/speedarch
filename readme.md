# Intro
	Speedarch : Automatic instalation with some defaults exemples
	systemd-boot, lvm, arch, i3, gvim, samba, cups, apache...

	I wrote this collection of simples bash script to improve my instalation.
	Your suggestions are welcome.
	joco55612@gmail.com

# Server
	SERVER="https://raw.githubusercontent.com/joco55612/speedarch/master"

	# Optional - Your personal server (script & pkg) if you already run arch
	curl -O $SERVER/speedarch.sh
	nano speedarch.sh
	bash speedarch.sh
	SERVER="192.168.2.101/speedarch"

	# Optional - You can also create your own fork (GPLv3)
	 cd /srv/http/speedarch
	 nano publish.sh
	 bash save.sh
	 bash publish.sh

# New machine (boot in efi the fresh arch iso)
	curl -O $SERVER/arch.sh
	nano arch.sh
	bash arch.sh

# Graphical user interface
	curl -O $SERVER/i3.sh
	nano i3.sh
	bash i3.sh
	reboot
	startx # test i3
	mv bash_profile .bash_profile # startx at the boot

# Softwares
	curl -O $SERVER/softwares.sh
	nano softwares.sh
	bash softwares.sh

# Graphical Workaround
	cups by firefox
	firefox configuration

# Todo list
	keyboard ca-fr
	bar.py - alsa icone
	systemd-boot : when I remove batterie from bios, system not boot
