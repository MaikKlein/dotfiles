#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK
#source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
exec i3
exec amixer set Master 100%
#exec startxfce4
#exec bspwm

#export KDEWM=/usr/bin/i3
#export DESKTOP_SESSION=plasma
#exec startplasma-x11
