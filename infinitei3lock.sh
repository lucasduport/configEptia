#!/bin/sh

alias i3lock='i3lock -e -f -p win -i ~/afs/.confs/wallpapers/goldengate.png'

while true;do
	{
		i3lock
        SECONDS=0
        while [ $SECONDS -lt 1500 ];do
			if [ $(($(pgrep i3lock | wc -l ))) -ge 1 ]; then
                killall "infinitei3lock."
				exit 0
			fi
		done
	    aklog
        killall i3lock
}
done
