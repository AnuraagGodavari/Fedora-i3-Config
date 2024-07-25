#!/bin/bash

# Move to script directory - work from here.

cd "$(dirname "$0")"

configpath='config'

sudo cp $configpath/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf
sudo cp $configpath/bluetooth.desktop /usr/share/applications/bluetooth.desktop

cp $configpath/i3               ~/.config/i3/config
cp $configpath/.zshrc           ~/.zshrc
cp -r $configpath/nvim/*         ~/.config/nvim
cp $configpath/gtk-3.0          ~/.config/gtk-3.0/settings.ini
cp $configpath/alacritty.toml   ~/.config/alacritty/alacritty.toml
cp -r $configpath/rofi/*          ~/.config/rofi
