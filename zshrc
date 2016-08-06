autoload -Uz colors && colors
autoload -Uz compinit && compinit -u

export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8

source ~/.zshrc.plugin
source ~/.zshrc.setting
source ~/.zshrc.alias
source ~/.zshrc.custom

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export LISTMAX=50
# Do not add in root
if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi
