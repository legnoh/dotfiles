#!/bin/bash

#########!!!!!! EMERGENCY !!!!!!##########
# this script cause your machine to cleanup.
# Please backup your local data before it exucute.

# change default shell
chsh -s /bin/bash

# uninstall homebrew and apps
brew uninstall --force $(brew list) && brew cleanup
brew cask uninstall --force $(brew cask list) && brew cask cleanup
brew untap homebrew/dupes
brew untap homebrew/versions
brew untap homebrew/binary
brew untap thoughtbot/formulae
brew untap caskroom/cask
brew untap caskroom/fonts
brew untap caskroom/versions
brew untap cloudfoundry/tap
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

# remove app info
sudo rm -rf /usr/local/Caskroom
sudo rm -rf /usr/local/Celler
sudo rm -rf /opt/*

# remove anyenv, zplug, etc
rm -rf ~/.account
rm -rf ~/.anyenv
rm -rf ~/.atom
rm -rf ~/.bash*
rm -rf ~/.brewfile
rm -rf ~/.cf
rm -rf ~/.composer
rm -rf ~/.config
rm -rf ~/.devcenter
rm -rf ~/.dropbox
rm -rf ~/.erlang*
rm -rf ~/.gem*
rm -rf ~/.git*
rm -rf ~/.*_history
rm -rf ~/.gnupg
rm -rf ~/.kafkatool
rm -rf ~/.mackup.cfg
rm -rf ~/.pcfdev
rm -rf ~/.ssh
rm -rf ~/.subversion
rm -rf ~/.v*
rm -rf ~/.z*
rm -rf ~/.*_history
rm -rf ~/src
