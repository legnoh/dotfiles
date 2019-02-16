# read answers
echo "Do you need private App? [y/N]: " && read PRIVATE
echo "What's your sudo password?: " && read -sp "Password: " PASSWORD

# command-line-tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    echo "Installing command-line-tools"
    xcode-select --install
    echo "Completed? [Y/n]: " && read ANS
    if [ "${ANS}" = "n" ]; then
      echo “Stoped...”
      exit 1;
    fi
fi

# Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install mas

# brew, cask, mas
brew update
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-brew.sh $PASSWORD &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-cask.sh $PASSWORD &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-mas.sh $PASSWORD &
if [ "${PRIVATE}" = "y" ]; then
    ~/code/src/github.com/legnoh/dotfiles/etc/macos/install-private.sh $PASSWORD &
fi

wait

# caskだけ妙に失敗するので、念を入れて再度手打ちで回す
brew bundle --file=~/code/src/github.com/legnoh/dotfiles/pkg/Brewfile.cask
if [ "${PRIVATE}" = "y" ]; then
    brew bundle --file=~/code/src/github.com/legnoh/dotfiles/pkg/Brewfile.private
fi

# install apm package
apm install --packages-file ~/code/src/github.com/legnoh/dotfiles/pkg/Atomfile &

# settings
## 「ライブラリ」を常時表示
chflags nohidden ~/Library

## ログインシェルをHomebrew版Zshに変更する(後で再起動する)
sudo sh -c 'echo "¥n/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

## homebrewのupdateとupgradeを定期時間で常にやるようにする
crontab ~/code/src/github.com/legnoh/dotfiles/pkg/crontab

# CF CLI PLugins
echo "installing CF Plugin packages..."
cf install-plugin -r CF-Community -f "cfdev"
cf install-plugin -r CF-Community -f "top"

### インストールしたAppの中で、設定が必要なものを一気に全て開く
echo "Open Apps..."
open "/Applications/1Password.app"
open "/Applications/Alfred 3.app"
open "/Applications/Bartender 3.app"
open "/Applications/BetterTouchTool.app"
open "/Applications/CheatSheet.app"
open "/Applications/Clipy.app"
open "/Applications/Docker.app"
open "/Applications/Google Chrome.app"
open "/Applications/GPG Keychain.app"
open "/Applications/Kitematic (Beta).app"
open "/Applications/PopClip.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"

wait
