#!/bin/sh

alias i3lock='i3lock -e -f -p win -i ~/afs/.confs/wallpapers/lockscreen.png'

i3lock
while [ $(ps -aux | grep -c \i3lock) -gt 3 ]; do
    first=1
    killall i3lock;
    i3lock
    sleep 2700;
done

killall infinitei3lock
