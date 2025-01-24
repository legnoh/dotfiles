#!/bin/bash

DOT=~/code/src/github.com/legnoh/dotfiles

# read answers
echo "Do you need private App? [y/N]: " && read PRIVATE
echo "What's your sudo password?: " && read -sp "Password: " PASSWORD

# judge M1/Intel
if [[ $(/usr/bin/uname -m) == "arm64" ]]; then
    echo "architecture: M1 Mac"
    # sudo touch id setting in sonoma
    # https://dev.to/siddhantkcode/enable-touch-id-authentication-for-sudo-on-macos-sonoma-14x-4d28
    sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
else
    echo "architecture: Intel Mac"
    HOMEBREW_PREFIX="/usr/local"
fi
# settings

## Global
defaults write -g AppleLanguages -array ja-JP en-JP
defaults write -g AppleShowAllExtensions -bool true
defaults write -g AppleShowScrollBars -string "WhenScrolling"
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSSpellCheckerContainerTransitionComplete -bool false
defaults write -g com.apple.sound.beep.feedback -bool true

## Finder
defaults write "com.apple.finder" FXEnableExtensionChangeWarning -bool false
defaults write "com.apple.finder" FXPreferredViewStyle -string "clmv"
defaults write "com.apple.finder" NewWindowTarget -string "PfLo"
defaults write "com.apple.finder" NewWindowTargetPath -string "file://${HOME}"
defaults write "com.apple.Finder" ShowExternalHardDrivesOnDesktop -bool true
defaults write "com.apple.Finder" ShowMountedServersOnDesktop -bool true
defaults write "com.apple.Finder" ShowRemovableMediaOnDesktop -bool true
defaults write "com.apple.finder" ShowPathbar -bool true
defaults write "com.apple.Finder" ShowStatusBar -bool true
defaults write "com.apple.Finder" WarnOnEmptyTrash -bool false
chflags nohidden ~/Library
killall Finder

## Dock
defaults write "com.apple.dock" autohide -int 1
defaults write "com.apple.dock" magnification -bool true
defaults write "com.apple.dock" mineffect -string "scale"
defaults write "com.apple.dock" minimize-to-application -bool true
defaults write "com.apple.dock" show-process-indicators -bool true
defaults write "com.apple.dock" show-recents -bool false
killall Dock
