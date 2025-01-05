export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000000
export SAVEHIST=1000000000000
export PROMPT_COMMAND='history -a; history -r'
export DOT=$HOME/code/src/github.com/legnoh/dotfiles
export GOPATH=$HOME/code
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# define HOMEBREW_PREFIX
if [[ $(/usr/bin/uname) == "Linux" ]]; then
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ $(/usr/bin/uname -m) == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

# override PATH
export PATH=${DOT}/bin:${GOPATH}/bin:${HOME}/.rd/bin:${HOMEBREW_PREFIX}/bin:${PATH}

# enable sheldon & starship
eval "$(sheldon source)"
eval "$(starship init zsh)"

# enable local settings
source ~/.zshrc.local
