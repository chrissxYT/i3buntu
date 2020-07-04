# i3buntu

This project is for setting up a minimal Ubuntu installation with
the i3 window managing system together with other options that will
make the operating system work and look well. The main goal of the
project is to construct a flavour of the Ubuntu operating system which
* it should contain all the default repositories plus more to allow for easy installation of most of the typical applications people want access to
* it should come preinstalled with all needed drivers
* the i3 window manager should be the default and only (preinstalled) window manager on the system. A number of customizations should be made in order for it to be both visually attractive and allow for productive workflows.


# Requirements
* A version of Ubuntu Minimal ([20.04](https://releases.ubuntu.com/20.04/ubuntu-20.04-desktop-amd64.iso) recommended, later ones may work, too).
* An internet connection.

# Installation

##### 1. Download and install Ubuntu Minimal

A guide on how to construct a installation media (CD, DVD or USB
key) can be found in the above link for Ubuntu Minimal. During the
installation select the English language and German keyboard layout,
uncheck the options for additional software. After the new
installation is booted, open a Terminal and optionally put your
config at `~/.i3brc`, like this:
```sh
wget -O ~/.i3brc https://i3b.chrissx.de/i3brcs/x220.i3brc
```

##### 2. Download and install i3buntu

Type the following in the Ubuntu Bash:
```sh
wget -O - https://i3b.chrissx.de/netsh | bash
```
This will download the startup script of i3buntu and run it.

# Updating/Upgrading
You can upgrade your existing i3buntu installation like this:
```sh
cd ~/.i3buntu
git pull
./update
```
WARNING: When upgrading across Ubuntu versions, expect stuff to break!
I recently tried upgrading from 19.10 to 20.04 and it broke a lot, so
be ready to reinstall.

# Testing
There is no reason why anyone other than me would want to do this, but
to quickly test i3buntu, use this command on a newly installed Ubuntu
Minimal:
```sh
wget -O - https://i3b.chrissx.de/test | sh
```
FYI: This only works, if you have an apt cache set up at
`192.168.2.102:3142`.

# Feedback
The project continues to be a work in progress. Even though I
constantly hope to have included everything necessary to make an
optimal setup I often realize that perfections can be made. Anyone
should feel absolutely free to come with suggestions on how to
improve the project. One may (for instance!) suggest:
* What packages to add. Again, I may have missed something which can easen our lives.
* How to make it easier for others to customize my setup.
* Something that I may not have thought of yet.

All suggestions are appreciated - and people may of course also fork
the project.
