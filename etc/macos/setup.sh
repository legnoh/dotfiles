# read answers
echo "Do you need private App? [y/N]: " && read PRIVATE
echo "What's your sudo password?: " && read -sp "Password: " PASSWORD

# command-line-tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    echo "Installing command-line-tools"
    xcode-select --install
    echo "Completed? [Y/n]: " && read ANS
    if [ "${ANS}" = "n" ]; then
      echo "Stoped..."
      exit 1;
    fi
fi

# Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew, cask, mas
brew tap homebrew/bundle
brew install mas
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-brew.sh $PASSWORD &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-cask.sh $PASSWORD &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-mas.sh $PASSWORD &
if [ "${PRIVATE}" = "y" ]; then
    ~/code/src/github.com/legnoh/dotfiles/etc/macos/install-private.sh $PASSWORD &
fi
wait

# settings

## change shell to zsh
~/code/src/github.com/legnoh/dotfiles/etc/macos/add-etcshells.sh $PASSWORD &
wait
chsh -s /usr/local/bin/zsh

## crontab
crontab ~/code/src/github.com/legnoh/dotfiles/pkg/crontab.mac

## CF CLI plugins
cf install-plugin -r CF-Community -f "cfdev"

## BetterTouchTool
open -a BetterTouchTool ~/code/src/github.com/legnoh/dotfiles/pkg/Default.bttpreset

## Popclip
curl -L http://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz -o /tmp/PasteAndMatch.popclipextz
curl -L http://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz -o /tmp/GoogleTranslate.popclipextz
curl -L https://github.com/legnoh/unixtime-jp.popclipext/releases/download/v1.0/unixtime-jp.zip -o /tmp/unixtime-jp.zip
unzip /tmp/unixtime-jp.zip -d /tmp
echo "please call it later:"
echo "open /tmp/PasteAndMatch.popclipextz"
echo "open /tmp/GoogleTranslate.popclipextz"
echo "open /tmp/unixtime-jp.popclipext"

# other gui app setting
open "/Applications/1Password.app"
open "/Applications/Alfred 3.app"
open "/Applications/CheatSheet.app"
open "/Applications/Clipy.app"
open "/Applications/Docker.app"
open "/Applications/Google Chrome.app"
open "/Applications/GPG Keychain.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"
