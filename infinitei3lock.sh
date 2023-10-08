#!/bin/sh

alias i3lock='i3lock -e -f -p win -i ~/afs/.confs/wallpapers/lockscreen.png'

while true;do
	{
		i3lock
        SECONDS=0
		while [ $SECONDS -lt 3180 ];do
			if [ $(ps aux | grep i3lock |wc -l) -eq 1 ]; then
				exit
			fi
		done
	    aklog
        killall i3lock
}
done
