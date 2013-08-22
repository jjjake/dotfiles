if [[ $(hostname) =~ "archive.org" ]]; then
    PATH=/home/jake/local/bin:$PATH
fi

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

export EDITOR=vim 
set mouse=a
set ttymouse=xterm2

# PATH
PATH=$PATH:$HOME/.rvm/bin

# PROMPT
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ '
export CLICOLOR=1;
export TERM="xterm-color"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# HISTORY
export HISTFILE="$ZDOTDIR/.history"
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1).
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# Colorize less
export LESSOPEN="|$HOME/.lessfilter %s"
export LESSCOLORIZER=pygmentize
export LESS="R"

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [[ $(uname) == "Darwin" ]]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
