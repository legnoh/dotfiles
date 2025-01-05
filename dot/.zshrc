export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000000
export SAVEHIST=1000000000000
export PROMPT_COMMAND='history -a; history -r'
export DOT=$HOME/code/src/github.com/legnoh/dotfiles
export GOPATH=$HOME/code
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

if [[ $(/usr/bin/uname) == "Linux" ]]; then
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ $(/usr/bin/uname -m) == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

export PATH=\
${DOT}/bin\
:${HOMEBREW_PREFIX}/bin\
:${HOME}/.local/bin\
:${HOME}/.rd/bin\
:${GOPATH}/bin\
:${PATH}

# enable zsh plugin provided by homebrew
export FPATH=${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}

# enable sheldon & starship
eval "$(sheldon source)"
eval "$(starship init zsh)"

# enable local settings
source ~/.zshrc.local

# some alias
alias gsw='gsw && source ~/.zshenv'
alias ls="ls -alhG"
