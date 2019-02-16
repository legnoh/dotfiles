#!/bin/bash

#########!!!!!! EMERGENCY !!!!!!##########
# this script cause your machine to cleanup.
# Please backup your local data before it exucute.

shopt -s dotglob
cd ~
# change default shell
echo "#1: change default shell to /bin/bash..."
chsh -s /bin/bash

# uninstall homebrew and apps
echo "#2: uninstall all homebrew formula..."
brew cask zap $(brew cask list)
brew uninstall --force $(brew list)

echo "#3: uninstall homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

# remove garbage files in system directory
echo "#4: uninstall gomi file..."
sudo rm -rf /usr/local/Caskroom /usr/local/Celler /usr/local/Homebrew /usr/local/MacGPG2 /opt/*

# remove users files
echo "#5: uninstall users file"
default_files=('.CFUserTextEncoding',
               '.DS_Store',
               '.Trash',
               'Applications',
               'Desktop',
               'Documents',
               'Downloads',
               'Library',
               'Movies',
               'Music',
               'Pictures',
               'Public');
for file in *; do
  if `echo ${default_files[@]} | grep -q "$file"` ; then
    echo "  existed: $file"
  else
    echo "  removing: $file"
    rm -rf $file
  fi
done

# remove command line tools
echo "#6: uninstall command line tools"
sudo rm -rf /Library/Developer/CommandLineTools

echo "destroy successfull. Please reboot machine or Please restore machine"
echo "https://support.apple.com/kb/PH25649?locale=ja_JP&viewlocale=ja_JP"
