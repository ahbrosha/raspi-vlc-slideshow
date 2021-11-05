#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

# install VLC and enable USB automount
sudo apt install -yq usbmount vlc

# copy VLC settings
mkdir -p ~/.config/vlc 
cp vlc/vlcrc ~/.config/vlc/vlcrc

# copy systemd service that triggers VLC
sudo cp systemd/vlc-slideshow.service /etc/systemd/system/ 

# copy Udev rule that triggers systemd
sudo cp udev/99-vlc-slideshow.rules /etc/udev/rules.d/ 

# Enable Desktop autologin
# B1 cli, B2 cli autologin, B3 desktop, B4 desktop autologin
raspi-config nonint do_boot_behaviour 

sudo reboot