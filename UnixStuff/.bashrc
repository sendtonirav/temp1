###############
### source ####
###############
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

###############
### colors ####
###############

rgb_restore="\[\033[00m\]"
rgb_black="\[\033[00;30m\]"
rgb_firebrick="\[\033[00;31m\]"
rgb_red="\[\033[01;31m\]"
rgb_forest="\[\033[00;32m\]"
rgb_green="\[\033[01;32m\]"
rgb_brown="\[\033[00;33m\]"
rgb_yellow="\[\033[01;33m\]"
rgb_navy="\[\033[00;34m\]"
rgb_blue="\[\033[01;34m\]"
rgb_purple="\[\033[00;35m\]"
rgb_magenta="\[\033[01;35m\]"
rgb_cadet="\[\033[00;36m\]"
rgb_cyan="\[\033[01;36m\]"
rgb_gray="\[\033[00;37m\]"
rgb_white="\[\033[01;37m\]"
rgb_std="${rgb_white}"




# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='[${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\h\[\033[00m\]] \[\033[00;31m\]\w\[\033[00m\]\$ '
    ;;
xterm-256color)
    PS1='[${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\h\[\033[00m\]] \[\033[00;31m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='[${debian_chroot:+($debian_chroot)}\h] \w\$ '
    ;;
esac


# enable color support of ls and also add handy aliases
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


#dirsize - finds directory sizes and lists them for the current directory
dirsize ()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm -rf /tmp/list
}

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups



function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}


extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }



###############
### aliases ###
###############

# Directory navigation aliases
alias .=pwd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -lart'

alias c="clear"
alias rm='rm -vi'

