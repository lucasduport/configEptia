#!/bin/sh

# Wallpapers
feh --randomize --bg-fill ~/afs/.confs/wallpapers/*

#Config vim
~/afs/.confs/install.sh

#Opacity
nix profile install nixpkgs#picom
picom -f -b
