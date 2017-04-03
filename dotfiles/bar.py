from i3pystatus import Status

# use atom to edit this file
# http://i3pystatus.readthedocs.io/en/latest/i3pystatus.html
# http://fontawesome.io/cheatsheet/

status = Status()
status.register("text", text = "  ", on_leftclick = "poweroff", on_rightclick = "reboot", )
status.register("clock",format="%X %a %-d %B ",)
# status.register("alsa",format="  {volume} ", on_leftclick = "amixer set Master 10%+", on_rightclick = "amixer set Master 10%-",)
status.register("text", text = "  urxvt", on_leftclick = "urxvt", on_rightclick = "kill $(ps aux | grep 'urxvt')", )
status.register("text", text = "  pcmanfm", on_leftclick = "pcmanfm",on_rightclick = "kill $(ps aux | grep 'pcmanfm')", )
status.register("text", text = "  firefox", on_leftclick = "firefox", on_rightclick = "kill $(ps aux | grep 'firefox')", )
status.register("text", text = "  libreoffice", on_leftclick = "libreoffice",on_rightclick = "kill $(ps aux | grep 'libreoffice')", )
status.register("text", text = "  inkscape", on_leftclick = "inkscape",on_rightclick = "kill $(ps aux | grep 'inkscape')", )
status.register("text", text = "  gimp", on_leftclick = "gimp",on_rightclick = "kill $(ps aux | grep 'gimp')", )
status.register("text", text = "  blender", on_leftclick = "blender",on_rightclick = "kill $(ps aux | grep 'blender')", )
status.register("text", text = "  virtualbox", on_leftclick = "virtualbox", on_rightclick = "kill $(ps aux | grep 'virtualbox')", )

# status.register("text", text = "  lightroom", on_leftclick = "VBoxHeadless -s 'lightroom' & sleep 7 && remmina -c /home/user/.local/share/remmina/1489571221111.remmina", on_rightclick = "vboxmanage controlvm lightroom acpipowerbutton && remmina -q", )
status.register("cpu_usage",format="  {usage_cpu0} {usage_cpu1} {usage_cpu2} {usage_cpu3}",)
status.register("mem",format="  {percent_used_mem}",)
status.register("network",
interface="enp3s0", format_up="  {bytes_sent}  {bytes_recv}",)
status.run()
