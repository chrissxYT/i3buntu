# i3buntu

This project is for setting up a minimal Ubuntu installation with
the i3 window managing system together with other options that will
make the operating system work and look well. The main goal of the
project is to construct a flavour of the Ubuntu operating system which
* it should contain all the default repositories plus more to allow for easy installation of most of the typical applications people want access to
* it should come preinstalled with all needed drivers
* the i3 window manager should be the default and only (preinstalled) window manager on the system. A number of customizations should be made in order for it to be both visually attractive and allow for productive workflows.


# Requirements
* A version of Ubuntu Minimal ([19.10](https://ubuntu.com/download/desktop/thank-you/?version=19.10&architecture=amd64) recommended, later ones may work, too).
* An internet connection.

# Installation

##### 1. Download and install Ubuntu Minimal

A guide on how to construct a installation media (CD, DVD or USB
key) can be found in the above link for Ubuntu Minimal. During the
installation select the English language and German keyboard layout,
uncheck the options for additional software. After the new
installation is booted, open a Terminal and optionally put your
config under ~/.i3brc.

##### 2. Download and install i3buntu

Type the following in the Ubuntu Bash:
```
wget -O - https://github.com/chrissxYT/i3buntu/raw/master/netsh | sh
```
This will download the most recent version of curl and use it to
download the netsh script from this GitHub account and run it.

# Feedback
The project continues to be a work in progress. Even though I
constantly hope to have included everything necessary to make an
optimal setup I often realize that perfections can be made. Anyone
should feel absolutely free to come with suggestions on how to
improve the project. One may (for instance!) suggest:
* What packages to add. Again, I may have missed something which can easen our lifes.
* How to make it easier for others to customize my setup.
* Something that I may not have thought of yet.

All suggestions are appreciated - and people may of course also fork
the project.
