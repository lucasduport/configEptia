#!/bin/sh

# Wallpapers
feh --randomize --bg-fill ~/afs/.confs/wallpapers/goldengate.png

#Config vim
~/afs/.confs/install.sh

#Opacity
nix profile install nixpkgs#picom
nix profile install nixpkgs#bat

picom -f -b
