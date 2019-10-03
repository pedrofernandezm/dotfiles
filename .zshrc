# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# ZSH_THEME="gallois"
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_DIR_TRUNC_REPO=false

# Note: zsh-syntax-highlighting needs to be the last element of the list
plugins=(git ruby rails autojump history-substring-search zsh-autosuggestions wakatime zsh-syntax-highlighting)

# Allow `[`, `]`, or `?`
unsetopt nomatch

source $HOME/.aliases

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'

zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export LC_ALL=en_US.UTF-8

# This must be the last line as it initializes the OhMyZsh framework
source $ZSH/oh-my-zsh.sh
#export PATH="/usr/local/sbin:$PATH"
