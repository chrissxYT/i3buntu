#!/bin/sh

###### Update package lists and upgrade preinstalled packages
apt update
apt upgrade -y

###### Install main apps, drivers and dependencies
apt install -y ubuntu-drivers-common ubuntu-restricted-extras\
	ttf-ubuntu-font-family openssh-client curl gcc g++\
	libstartup-notification0 clang clang++ evince evince-common\
	make autoconf automake x11-xserver-utils arandr pavucontrol\
	dconf-tools python-gconf lxappearance\
	policykit-desktop-privileges policykit-1-gnome vim thunar\
	gnome-system-tools network-manager wireless-tools\
	overlay-scrollbar overlay-scrollbar-gtk2\
	pulseaudio-module-x11 totem-plugins gromit\
	gstreamer1.0-pulseaudio transmission-gtk pulseaudio-utils\
	xbacklight feh rofi compton gnome-terminal i3 i3-wm i3blocks\
	i3status xserver-xorg-video-intel hplip acpi-support\
	apport-gtk foomatic-db-compressed-ppds evince evince-common\
	libssh-4 libnm-glib-vpn1 dmz-cursor-theme libwayland-cursor0\
	libxcursor1 xcursor-themes mousetweaks laptop-detect\
	update-inetd update-notifier update-notifier-common\
	usb-creator-common usb-creator-gtk gnome-power-manager\
	libgsettings-qt1 libproxy1-plugin-gsettings\
	libappindicator3-1 gir1.2-appindicator3-0.1 gdebi\
	openjdk-8-jdk apt-transport-https
snap install vscode --classic
curl -L -o pmp.deb https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i pmp.deb
rm -f pmp.deb
add-apt-repository universe
apt update
apt install -y dotnet-sdk-2.2
apt install -y zsh htop tmux dosbox blender w3m progress ncdu icdiff\
	kdenlive mplayer obs-studio gimp audacity rdesktop tor\
	lm-sensors gnome-screensaver wireshark libudev-dev cmake\
	fonts-powerline

###### Get and install FlashPrint
curl -L -o fp.deb 'http://www.sz3dp.com/upfile/2018/12/03/20181203162713_662.deb'
dpkg -i fp.deb
rm -f fp.deb

###### Get and install playerctl
curl -L -o pc.deb 'https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb'
dpkg -i pc.deb
rm -f pc.deb

###### Get and install Chrome
curl -L -o ch.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
dpkg -i ch.deb
rm -f ch.deb

###### Make config directories
mkdir ~/.config
mkdir ~/.config/i3

###### Set configs
cp -f configs/i3/config ~/.config/i3/config
cp -f configs/i3/i3status ~/.config/i3/i3status

###### Install Oh-my-zsh
curl -L -o omz.sh 'https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
chmod +x omz.sh
zsh omz.sh
rm -f omz.sh
cp configs/zshrc ~/.zshrc

###### Remove bloatware
apt remove -y firefox gedit
#apt remove -y gnome-keyring
#apt remove -y gnome-bluetooth
#apt remove -y gnome-accessibility-themes
apt remove -y gnome-user-docs gnome-user-guide
#apt remove -y gnome-disk-utility
#apt remove -y gnome-software
#snap remove gnome-calculator
#snap remove gnome-system-monitor
#snap remove gnome-characters

###### Install helper "scripts"
cp -f tools/ghk /bin/ghk
cp -f tools/ghp /bin/ghp
cp -f tools/ftb /bin/ftb
vim ghk.txt
openssl aes-256-cbc -a -in ghk.txt -out ~/.ghk.enc
rm -f ghk.txt
find /sys/ -type f -iname '*brightness*' | grep intel
echo please select your backlight without the /brightness in it
read backlight
ln -s $backlight /sys/class/backlight
curl -L -o ~/.ftb.jar http://ftb.cursecdn.com/FTB2/launcher/FTB_Launcher.jar

###### Reboot the system
shutdown -r now
