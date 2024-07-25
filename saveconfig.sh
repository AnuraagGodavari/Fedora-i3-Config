#!/bin/bash

# Move to script directory - work from here.

cd "$(dirname "$0")"

configpath='config'

sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf $configpath/40-libinput.conf
sudo cp /usr/share/applications/bluetooth.desktop $configpath/bluetooth.desktop

cp ~/.config/i3/config                  $configpath/i3
cp ~/.zshrc                             $configpath/.zshrc
cp -r ~/.config/nvim/*                  $configpath/nvim
cp ~/.config/gtk-3.0/settings.ini       $configpath/gtk-3.0
cp ~/.config/alacritty/alacritty.toml   $configpath/alacritty.toml
cp -r ~/.config/rofi/*                  $configpath/rofi
