export LANG=en_US.UTF-8
[ -z "$PS1" ] && return

# We define three associative arrays, for effects, foreground colors and background colors.
typeset -Ag FX FG BG

FX=(
    reset     ""
    bold      "" no-bold      ""
    italic    "" no-italic    ""
    underline "" no-underline ""
    blink     "" no-blink     ""
    reverse   "" no-reverse   ""
)

local SUPPORT
SUPPORT=256
# Fill the color maps.
for color in {000..$SUPPORT}; do
    FG[$color]="{color}m"
    BG[$color]="{color}m"
done

# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
export HISTFILE="$ZDOTDIR/.history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt appendhistory autocd extendedglob
# End of lines configured by zsh-newuser-install

autoload -U colors && colors
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_NO_STORE
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
#export PS1="%{$fg[red]%}%?%{$reset_color%} %@:%{$fg[green]%}%n@(printf "%03d" "$(hostname | openssl sha1 -binary | od -N1 -tu2 -An)")m%m:%{$fg[cyan]%}%~%{$reset_color%} %h %(!.☭.π) "
export PS1="%{$fg[red]%}%? %{$fg[cyan]%}%n%{$fg[grey]%}@%{$fg[red]%}%m:%{$fg[cyan]%}%~%{$reset_color%} %h %{$fg[red]%}%(!.☭.π)%{$reset_color%} "

export EDITOR=vim && bindkey -e
export DISABLE_AUTO_TITLE=true
export REPORTTIME=30

source "$HOME/.aliases"

unsetopt CORRECT_ALL
setopt AUTO_CD
setopt NOHUP
setopt AUTO_CONTINUE
setopt NO_CHECK_JOBS 
setopt NO_BG_NICE
setopt INTERACTIVECOMMENTS
setopt PROMPT_SP
setopt PROMPTCR
setopt COMPLETE_IN_WORD
setopt NOCLOBBER
setopt RM_STAR_WAIT

# History settings
export HISTIGNORE="ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
setopt HIST_IGNORE_SPACE
source $ZDOTDIR/plugins/history-substring-search/history-substring-search.zsh

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey "^p" history-substring-search-up
bindkey "^n" history-substring-search-down


# Load plugins
source $ZDOTDIR/plugins/git/git.plugin.zsh
source $ZDOTDIR/plugins/python/python.plugin.zsh

# Mac/Darwin configuration
if [[ $(uname) == "Darwin" ]] ; then
    source $ZDOTDIR/plugins/osx/osx.plugin.zsh
    source $ZDOTDIR/plugins/brew/brew.plugin.zsh
    #PLAN9=/usr/local/plan9 export 
    export PATH=/usr/local/bin:$PATH
fi

# Linux configuration
if [[ $(uname) == "Linux" ]] ; then
    #set mouse=a
    #set ttymouse=xterm2
    export PYTHONPATH=$PYTHONPATH:/petabox/sw/lib/python:/usr/lib/python2.7/dist-packages
fi

eval "$(dircolors -b)"
