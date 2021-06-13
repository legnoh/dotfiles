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
export PATH=${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:$DOT/bin:${GOPATH}/bin:${HOMEBREW_PREFIX}/opt/go/bin:${HOMEBREW_PREFIX}/opt/node/bin:${PATH}
export FPATH=${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}

source ~/.zinit/bin/zinit.zsh

zinit light denysdovhan/spaceship-prompt

zinit ice wait"0" silent
zinit light zdharma/fast-syntax-highlighting

zinit ice wait"0" silent
zinit load psprint/zsh-navigation-tools

zinit ice wait"0" silent
zinit load zsh-users/zsh-completions

zinit ice wait"!0" atload"_zsh_autosuggest_start" silent
zinit load zsh-users/zsh-autosuggestions

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh" silent
zinit light direnv/direnv

zinit ice wait"0" silent
zinit light "marzocchi/zsh-notify"

zinit ice as"program" make'!' atclone'echo "source ~/.zplugin/plugins/b4b4r07---enhancd/init.sh" > zhook.zsh' src"zhook.zsh" silent
zinit load "b4b4r07/enhancd"

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
