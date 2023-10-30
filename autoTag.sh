#!/bin/sh

if [ $# -ne 1 ];
    then echo "$0 takes exactly 1 argument"; exit 1;
fi

if [ ! -d $1 ];
    then echo "$0 takes a directory as argument"; exit 1;
fi

find . -iname "*.h" -o -iname "*.c" | xargs clang-format -i
tree -p -a $1
echo
git status -u -s $1

printf "\nPlease, confirm that you want to tag.\n"; read
exercise="$(echo "$1" |sed "s|/||")"
tagnumber="$(git tag | grep -c -- "-${exercise}-")"
tagnumber=$(( "$tagnumber" + 1))
git add "$1"
git commit -m "${exercise}: tag number ${tagnumber}"
git tag -ma "exercises-${exercise}-${tagnumber}"
git push --follow-tags
