source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.aliases
source $HOME/.ia

# Colorize less
export LESSOPEN="|$HOME/.lessfilter %s"
export LESSCOLORIZER=pygmentize
export LESS="R"

# Load user scripts/sources
autoload $HOME/.ia
autoload -U $HOME/.dotfiles/src/zsh_aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Virturalenv Wrapper:
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python`
source $(which virtualenvwrapper.sh)
source $ZDOTDIR/plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh

# Mac/Darwin configuration
if [[ `uname` == "Darwin" ]] ; then
    # Load virtualenv-burrito (virtualenv/virtualenvwrapper).
    # https://github.com/brainsik/virtualenv-burrito#readme
    source $HOME/.venvburrito/startup.sh
fi
