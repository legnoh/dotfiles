export LANG=ja_JP.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000000
export SAVEHIST=1000000000000
export PROMPT_COMMAND='history -a; history -r'
export DOT=$HOME/code/src/github.com/legnoh/dotfiles
export GOPATH=$HOME/code
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$DOT/bin:$GOPATH/bin:/usr/local/opt/go@1.13/bin:/usr/local/opt/node@12/bin:$PATH
export SPACESHIP_GIT_SYMBOL='🌳 '
export SPACESHIP_DIR_LOCK_SYMBOL='🔒 '
export SPACESHIP_GIT_SUFFIX=" 🤓 $(git config user.email) "
export SYSTEMICON='/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources'
export ENHANCD_FILTER=fzf

zstyle ':notify:*' success-icon "${SYSTEMICON}/AlertNoteIcon.icns"
zstyle ':notify:*' error-icon "${SYSTEMICON}/AlertStopIcon.icns"
