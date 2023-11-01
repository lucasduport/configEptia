#!/bin/sh

if [ $# -eq 0 ]; then
	echo "$0 takes 1 or 2 arguments"; exit 1;
fi

if [ $# -gt 2 ]; then
    echo "$0 takes 1 or 2 arguments"; exit 1;
fi

if [ ! -d $1 ]; then
    echo "$0 takes a directory as argument"; exit 1;
fi

find . -iname "*.h" -o -iname "*.c" | xargs clang-format -i
tree -p -a $1
echo
git status -u -s $1

printf "\nPlease, confirm that you want to tag.\n"
read NOTHING

git add "$1"

if [ $# -eq 1 ]; then
    tagnumber="$(git tag | grep -c -- "-${exercise}-")"
    tagnumber=$(( "$tagnumber" + 1))
    exercise="$(echo "$1" |sed "s|/||")"
    git commit -m "${exercise}: tag number ${tagnumber}"
    git tag -ma "exercises-${exercise}-${tagnumber}"
else
    exercise="$2"
    git commit -m "$2"
    git tag -ma "$2"
fi

git push --follow-tags
