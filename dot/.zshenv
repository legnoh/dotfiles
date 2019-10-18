export LANG=ja_JP.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000000
export SAVEHIST=1000000000000
export PROMPT_COMMAND='history -a; history -r'
export DOT=$HOME/code/src/github.com/legnoh/dotfiles
export GOPATH=$HOME/code
export PATH=$DOT/bin:$GOPATH/bin:$PATH
export SPACESHIP_GIT_SYMBOL='🌳 '
export SPACESHIP_DIR_LOCK_SYMBOL='🔒 '
export SYSTEMICON='/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources'

zstyle ':notify:*' success-icon "${SYSTEMICON}/AlertNoteIcon.icns"
zstyle ':notify:*' error-icon "${SYSTEMICON}/AlertStopIcon.icns"
