[ -z "$PS1" ] && return
export LANG=en_US.UTF-8

autoload -U colors && colors
export PS1="%{$fg[red]%}%? %{$fg[cyan]%}%n%{$fg[grey]%}@%{$fg[red]%}%m%{$fg[grey]%}:%~%{$reset_color%} %h %{$fg[red]%}%(!.☭.π)%{$reset_color%} "
#autoload -Uz promptinit && promptinit && prompt adam1

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
export HISTFILE="$ZDOTDIR/.history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTIGNORE="ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt APPENDHISTORY 
setopt AUTOCD 
setopt EXTENDEDGLOB
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
source $ZDOTDIR/plugins/history-substring-search/history-substring-search.zsh

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey "^p" history-substring-search-up
bindkey "^n" history-substring-search-down

autoload -U compinit && compinit -i

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
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]}'
#zstyle ':completion:*' menu select=0
#zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:rm:*' ignore-line yes
zstyle :compinstall filename '/home/jake/.zcomp'
