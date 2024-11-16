export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000000
export SAVEHIST=1000000000000
export PROMPT_COMMAND='history -a; history -r'
export DOT=$HOME/code/src/github.com/legnoh/dotfiles
export GOPATH=$HOME/code

if [[ $(/usr/bin/uname) == "Linux" ]]; then
  # linux
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ $(/usr/bin/uname -m) == "arm64" ]]; then
  # mac-arm
  HOMEBREW_PREFIX="/opt/homebrew"
else
  # mac-amd
  HOMEBREW_PREFIX="/usr/local"
fi

export PATH=\
${DOT}/bin\
:${HOMEBREW_PREFIX}/bin\
:${HOME}/.local/bin\
:${HOME}/.rd/bin\
:${GOPATH}/bin\
:${PATH}

export FPATH=\
${HOMEBREW_PREFIX}/share/zsh/site-functions\
:${FPATH}

alias gsw='gsw && source ~/.zshenv'
alias ls="ls -alhG"

eval "$(starship init zsh)"
source ~/.zshrc.local
