#!/bin/bash

#########!!!!!! EMERGENCY !!!!!!##########
# this script cause your machine to cleanup.
# Please backup your local data before it exucute.

shopt -s dotglob
cd ~

# uninstall homebrew and apps
echo "#2: uninstall all homebrew formula..."

# remove mac app store in manually
# FYI: https://github.com/mas-cli/mas/issues/313
mas list | cut -d " " -f1 | while read line; do sudo mas uninstall ${line}; done

# add full disk access permission to terminal
# FYI: https://support.apple.com/ja-jp/HT210595
brew uninstall --force --zap $(brew list --cask)
brew uninstall --force $(brew list --formula)

echo "#3: uninstall homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"

# remove garbage files in system directory
echo "#4: uninstall gomi file..."
if [[ $(/usr/bin/uname -m) == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
else
    HOMEBREW_PREFIX="/usr/local"
fi
sudo rm -rf ${HOMEBREW_PREFIX}/Caskroom ${HOMEBREW_PREFIX}/Celler ${HOMEBREW_PREFIX}/Homebrew ${HOMEBREW_PREFIX}/MacGPG2 /opt/*

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
    echo "  existed: ${file}"
  else
    echo "  removing: ${file}"
    rm -rf ${file}
  fi
done

# remove command line tools
echo "#6: uninstall command line tools"
sudo rm -rf /Library/Developer/CommandLineTools

echo "destroy successfull. Please reboot machine or Please restore machine"
echo "FYI: Reinstall macOS - Apple Support"
open "https://support.apple.com/ja-jp/HT201065"
open "https://support.apple.com/ja-jp/HT204904"
