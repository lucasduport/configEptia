#!/bin/sh

# Wallpapers
feh --randomize --bg-fill ~/afs/.confs/wallpapers/*

#Config vim
~/afs/.confs/install.sh

#Opacity
nix profile install nixpkgs#picom
nix profile install nixpkgs#bat

picom -f -b
