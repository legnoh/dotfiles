if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
  UNAME_MACHINE="$(/usr/bin/uname -m)"

  if [[ "$UNAME_MACHINE" == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    HOMEBREW_PREFIX="/usr/local"
  fi
else
  UNAME_MACHINE="$(uname -m)"
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi
export PATH=$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$DOT/bin:$GOPATH/bin:$HOMEBREW_PREFIX/opt/go/bin:$HOMEBREW_PREFIX/opt/node/bin:$PATH
export FPATH=$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH

source ~/.zplugin/bin/zplugin.zsh

zplugin light denysdovhan/spaceship-prompt

zplugin ice wait"0" silent
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait"0" silent
zplugin load psprint/zsh-navigation-tools

zplugin ice wait"0" silent
zplugin load zsh-users/zsh-completions

zplugin ice wait"!0" atload"_zsh_autosuggest_start" silent
zplugin load zsh-users/zsh-autosuggestions

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh" silent
zplugin light direnv/direnv

zplugin ice wait"0" silent
zplugin light "marzocchi/zsh-notify"

zplugin ice as"program" make'!' atclone'echo "source ~/.zplugin/plugins/b4b4r07---enhancd/init.sh" > zhook.zsh' src"zhook.zsh" silent
zplugin load "b4b4r07/enhancd"

alias cflpws='cf l -a api.run.pivotal.io'
alias gsw='gsw && source ~/.zshenv'
alias ls="ls -alhG"

gg() {
  ghq get --look $1
}

gcd() {
  local repo_path=`ghq list --full-path | fzf --reverse --preview "less {1}/README.md"`
  \cd ${repo_path}
}

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

zpcompinit
zpcdreplay
