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
alias ls='ls --color=auto'
alias gs='git status --porcelain'
alias grep='grep --color -n'
alias la='ls -a'
alias makeshortcut="ln -s"
alias here="pwd | xsel -b"
alias copy="xsel -b"
alias touchScript="printf '#!/bin/sh\n\n\n' > "
alias confs="cd ~/afs/.confs"
alias vim='nvim'
alias s5='cd /home/lucas.duport/afs/ING/S5/piscine_c'
alias i3lock='i3lock -e -f -p win -i ~/afs/.confs/wallpapers/palaceoffinearts.png'
alias netticheck='~/afs/ING/S5/netiquette_checker/leodagan.py -vv'
alias autoTag='~/afs/.confs/autoTag.sh'

export PS1='\[\e[;35m\][\w]\$ \[\e[m\]'
