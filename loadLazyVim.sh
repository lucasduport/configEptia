#!/bin/sh

cp -r /home/lucas.duport/afs/.confs/fonts ~/.local/share/
fc-cache -f

packages_list='neovim ripgrep nerdfonts lazygit packer'

#Neovim and other
for package in $packages_list;
do
    nix profile install nixpkgs#$package
done;

rm -rf ~/.config/nvim
cp -r /home/lucas.duport/afs/.confs/nvim ~/.config/

nvim --headless -c 'Lazy install' -c 'Lazy update' 2> /dev/null &
