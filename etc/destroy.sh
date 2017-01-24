#!/bin/bash

#########!!!!!! EMERGENCY !!!!!!##########
# this script cause your machine to cleanup.
# Please backup your local data before it exucute.

# change default shell
chsh -s /bin/bash

# uninstall homebrew and apps
brew cask uninstall --force $(brew cask list) && brew cask cleanup
brew uninstall --force $(brew list) && brew cleanup
brew untap cloudfoundry/tap
brew untap caskroom/cask
brew untap caskroom/fonts
brew untap caskroom/versions
brew untap thoughtbot/formulae
brew untap homebrew/dupes
brew untap homebrew/versions
brew untap homebrew/binary
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
rm -rf ~/.berkshelf
rm -rf ~/.bundle
rm -rf ~/.brewfile
rm -rf ~/.cache
rm -rf ~/.chef
rm -rf ~/.chefdk
rm -rf ~/.cf
rm -rf ~/.composer
rm -rf ~/.config
rm -rf ~/.devcenter
rm -rf ~/.dropbox
rm -rf ~/.eclipse
rm -rf ~/.erlang*
rm -rf ~/.flyrc
rm -rf ~/.gem*
rm -rf ~/.git*
rm -rf ~/.glide
rm -rf ~/.gnupg
rm -rf ~/.gradle
rm -rf ~/.gvm
rm -rf ~/.*_history
rm -rf ~/.JIRAClient
rm -rf ~/.kafkatool
rm -rf ~/.m2
rm -rf ~/.mackup.cfg
rm -rf ~/.npm
rm -rf ~/.oracle_jre_usage
rm -rf ~/.p2
rm -rf ~/.pcfdev
rm -rf ~/.ssh
rm -rf ~/.subversion
rm -rf ~/.tooling
rm -rf ~/.uaac
rm -rf ~/.v*
rm -rf ~/.wget-hsts
rm -rf ~/.z*
rm -rf ~/.*_history
rm -rf ~/src
rm -rf ~/VirtualBox\ VMs

# remove command line tools
sudo rm -rf /Library/Developer/CommandLineTools
