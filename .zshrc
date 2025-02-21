export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="spaceship"

# Plugins.
plugins=(git)

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

export GPG_TTY=$(tty)
