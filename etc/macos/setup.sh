#!/bin/bash

# read answers
echo "Do you need private App? [y/N]: " && read PRIVATE
echo "What's your sudo password?: " && read -sp "Password: " PASSWORD

# install command-line-tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    echo "Installing command-line-tools"
    xcode-select --install
    echo "Completed? [Y/n]: " && read ANS
    if [[ "${ANS}" = "n" ]]; then
      echo "Stoped..."
      exit 1;
    fi
fi

# install Homebrew, bundle, mas
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/bundle
    brew tap caskroom/cask
fi

# install brew packages
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-brew.sh ${PASSWORD} &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-cask.sh ${PASSWORD} &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-mas.sh ${PASSWORD} &
if [[ "${PRIVATE}" = "y" ]]; then
    ~/code/src/github.com/legnoh/dotfiles/etc/macos/install-private.sh ${PASSWORD} &
fi
wait

# settings

## change shell to zsh
sudo sh -c 'echo "¥n/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

## gitignore
/usr/local/bin/gibo update && /usr/local/bin/gibo dump macOS Windows Linux JetBrains Vim > ~/.gitignore
echo "\n.idea/workspace.xml" >> ~/.gitignore

## crontab
crontab ~/code/src/github.com/legnoh/dotfiles/pkg/crontab.mac

## CF CLI plugins
cf install-plugin -r CF-Community -f "cfdev"

## BetterTouchTool
open ~/code/src/github.com/legnoh/dotfiles/pkg/Default.bttpreset

## PopClip
curl -L http://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz -o /tmp/PasteAndMatch.popclipextz
curl -L http://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz -o /tmp/GoogleTranslate.popclipextz
curl -L https://github.com/legnoh/unixtime-jp.popclipext/releases/download/v1.0/unixtime-jp.zip -o /tmp/unixtime-jp.zip
unzip /tmp/unixtime-jp.zip -d /tmp

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
