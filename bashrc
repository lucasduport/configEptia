# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
	export PATH=~/afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=nvim
#export EDITOR=emacs

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#Customization
# vim Vianney
export PATH="/run/current-system/sw/bin/clangd:$PATH"

alias ls='ls --color=auto'
alias gs='git status --porcelain'
alias grep='grep --color -n'
alias la='ls -a'
alias makeshortcut="ln -s"
alias here="pwd | xsel -b"
alias copy="xsel -b"

function touchScript(){
    if [ $# -ne 1 ]; then
        echo "Wrong arg number"
        exit 1
    else
        printf '#!/bin/sh\n\n\n' > $1
        chmod u+x $1
    fi
}

function touchHeader(){
    printf "#ifndef MY_HEADER_FILENAME_H\n\
#define MY_HEADER_FILENAME_H\n\
\n\
#endif\n" > $1.h
}

alias confs="cd ~/afs/.confs"
alias vim='nvim'

alias s5='cd /home/lucas.duport/afs/ING/S5/piscine_c'
alias psc='cd /home/lucas.duport/afs/ING/S5/piscine_c'

alias format='find . -iname *.h -o -iname *.c | xargs clang-format -i ~/afs/ING/coding-style/.clang-format'
alias formatCheck='python3 ~/afs/ING/coding-style/moulinette.py'
alias netticheck='~/afs/ING/netiquette_checker/leodagan.py -vv'
alias autoTag='~/afs/.confs/autoTag.sh'
alias touchMakefile='cp ~/afs/.confs/genericMakefile $(pwd)/Makefile'
alias wrapImg='convert -scale 1920x1080 -gravity center'

function gccc(){
    if [ $# -eq 1 ]; then
        gcc -Wextra -Wall -Werror -Wvla -pedantic -std=c99 -o test $1
        ./test
        printf "[%d]\n" $?

        rm -rf test
    elif [ $# -eq 2 ]; then
        gcc -Wextra -Wall -Werror -Wvla -pedantic -std=c99 -o $1 $2
        ./$1
        printf "[%d]\n" $?
    else
        echo "Wrong arg nb"
        exit 1
    fi
}

STARTCOLOR='\[\e[;35m\]';
ENDCOLOR="\[\e[m\]"

export PS1="$STARTCOLOR[\$?][...\${PWD#\${PWD%/*/*/*}}]$ $ENDCOLOR"

