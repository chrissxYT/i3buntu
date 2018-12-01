#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#

###### Update package lists
apt update

###### Install main apps, drivers and dependencies
apt install -y ubuntu-drivers-common
apt install -y ubuntu-restricted-extras
apt install -y ttf-ubuntu-font-family
apt install -y openssh-client curl gcc g++
apt install -y libstartup-notification0
apt install -y evince evince-common make autoconf automake
apt install -y x11-xserver-utils arandr
apt install -y pavucontrol dconf-tools
apt install -y python-gconf lxappearance
apt install -y policykit-desktop-privileges
apt install -y policykit-1-gnome vim thunar
apt install -y gnome-system-monitor gnome-system-tools
apt install -y network-manager wireless-tools
apt install -y lightdm-gtk-greeter lightdm-gtk-greeter-settings
apt install -y overlay-scrollbar overlay-scrollbar-gtk2
apt install -y pulseaudio-module-x11
apt install -y totem-plugins gromit gstreamer1.0-pulseaudio
apt install -y transmission-gtk pulseaudio-utils xbacklight
apt install -y feh rofi compton gnome-terminal
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y xserver-xorg-video-intel
apt install -y acpi-support apport-gtk foomatic-db-compressed-ppds
apt install -y hplip
apt install -y evince evince-common libssh-4 libnm-glib-vpn1
apt install -y dmz-cursor-theme libwayland-cursor0
apt install -y libxcursor1 xcursor-themes
apt install -y mousetweaks laptop-detect
apt install -y update-inetd update-notifier update-notifier-common
apt install -y usb-creator-common usb-creator-gtk
apt install -y gnome-power-manager
apt install -y libgsettings-qt1 libproxy1-plugin-gsettings
apt install -y libappindicator3-1 gir1.2-appindicator3-0.1 gdebi
snap install vscode --classic
snap install dotnet-sdk --classic
apt install -y zsh htop tmux

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

###### Install Oh-my-zsh
curl -o omz.sh https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
chmod +x omz.sh
zsh omz.sh
rm -f omz.sh

###### Remove bloatware
apt remove -y firefox
apt remove -y gnome-keyring
apt remove -y gnome-bluetooth
apt remove -y gnome-accessibility-themes
apt remove -y gnome-user-docs
apt remove -y gnome-user-guide
apt remove -y gnome-disk-utility
apt remove -y gnome-software
snap remove gnome-calculator
snap remove gnome-system-monitor
snap remove gnome-characters

###### Install helper "scripts"
cp -f tools/y /bin/y
cp -f tools/ghk /bin/ghk
cp -f tools/ghp /bin/ghp
vim ghk.txt
openssl aes-256-cbc -a -in ghk.txt -out ~/.ghk.enc
rm -f ghk.txt
find /sys/ -type f -iname '*brightness*' | grep intel
echo please select your backlight without the /brightness in it
sudo ln -s $backlight /sys/class/backlight
