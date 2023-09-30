#!/bin/sh

alias i3lock='i3lock -e -f -p win -i ~/afs/.confs/wallpapers/palaceoffinearts.png'

while [ $(ps -aux | grep -c \i3lock) -gt 3 ]; do
    killall \i3lock;
    i3lock
    sleep 2700;
done

killall infinitei3lock
