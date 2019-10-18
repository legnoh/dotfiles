source ~/.zplugin/bin/zplugin.zsh

zplugin light denysdovhan/spaceship-prompt

<<<<<<< Updated upstream
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

=======
zplugin ice wait"!0" silent
zplugin load psprint/zsh-navigation-tools

zplugin ice wait"!0" atload"_zsh_autosuggest_start" silent
zplugin load zsh-users/zsh-autosuggestions

zplugin ice wait"!0" silent
zplugin load zsh-users/zsh-completions

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh" silent
zplugin light direnv/direnv

>>>>>>> Stashed changes
alias cflpws='cf l -a api.run.pivotal.io'
alias gl="ghq look"
alias ls="ls -alhG"

<<<<<<< Updated upstream
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
=======
source $HOME/.zshrc.local
>>>>>>> Stashed changes

zpcompinit
zpcdreplay