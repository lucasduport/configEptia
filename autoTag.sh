#!/bin/sh

if [ $# -ne 1 ];
    then echo "$0 takes exactly 1 argument"; exit 1;
fi

if [ ! -d $1 ];
    then echo "$0 takes a directory as argument"; exit 1;
fi

tree $1
git status $1
printf "\nPlease, confirm that you want to tag.\n"; read uselessVar

exercise="$(echo "$1" |sed "s|/||")"
tagnumber="$(git tag | grep -c "${exercise}-")"
tagnumber=$(( "$tagnumber" + 1))
git add "$1"
git commit -m "${exercise}: tag number ${tagnumber}"
git tag -ma "exercises-${exercise}-${tagnumber}"
git push --follow-tags
