#!/bin/bash

DOT=~/code/src/github.com/legnoh/dotfiles

# read answers
echo "Do you need private App? [y/N]: " && read PRIVATE
echo "What's your sudo password?: " && read -sp "Password: " PASSWORD

# judge M1/Intel
if [[ $(/usr/bin/uname -m) == "arm64" ]]; then
    echo "architecture: M1 Mac"
    HOMEBREW_PREFIX="/opt/homebrew"
    if [[ "${PRIVATE}" = "y" ]]; then
        sudo softwareupdate --install-rosetta
    fi
else
    echo "architecture: Intel Mac"
    HOMEBREW_PREFIX="/usr/local"
fi
export PATH=${HOMEBREW_PREFIX}/bin:${PATH}

# install Homebrew(with CommandLineTools), bundle
if test ! $(which brew); then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap homebrew/bundle
    brew tap homebrew/cask-fonts
    brew tap legnoh/etc
fi

# install brew packages
${DOT}/etc/macos/install-brew.sh ${PASSWORD} Brewfile &
if [[ "${PRIVATE}" = "y" ]]; then
    ${DOT}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.private &
fi
wait

# settings

## zinit
## https://github.com/zsh-users/zsh-completions/issues/433#issuecomment-390600994
chmod 755 ${HOMEBREW_PREFIX}/share/zsh/site-functions
chmod 755 ${HOMEBREW_PREFIX}/share/zsh

## gitignore
gibo update && gibo dump macOS VisualStudioCode Vim > ~/.gitignore

## crontab
crontab ${DOT}/pkg/crontab.mac

## VSCode settings.json and locale.json
VSCODE_CONF_DIR=~/Library/Application\ Support/Code/User
ln -fs ${DOT}/pkg/vsc-settings.json ${VSCODE_CONF_DIR}/settings.json
ln -fs ${DOT}/pkg/vsc-locale.json ${VSCODE_CONF_DIR}/locale.json

## VSCode plugins
code --install-extension bungcip.better-toml
code --install-extension cocopon.iceberg-theme
code --install-extension GitHub.vscode-pull-request-github
code --install-extension ms-azuretools.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-ja
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode.Go
code --install-extension ms-vscode-remote.remote-containers
code --install-extension redhat.vscode-yaml
code --install-extension tyriar.sort-lines
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons

## BetterTouchTool
open ${DOT}/pkg/Default.bttpreset

## PopClip
curl -L https://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz -o /tmp/PasteAndMatch.popclipextz
curl -L https://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz -o /tmp/GoogleTranslate.popclipextz
curl -L https://pilotmoon.com/popclip/extensions/ext/UnixTime.popclipextz -o /tmp/UnixTime.popclipextz

## terminal theme
open ${DOT}/pkg/iceberg.terminal

# open gui installers
open "${HOMEBREW_PREFIX}/Caskroom/logi-options-plus/latest/logioptionsplus_installer.app"

# other gui app setting
open "/Applications/1Password.app"
open "/Applications/Alfred 5.app"
open "/Applications/BetterTouchTool.app"
open "/Applications/Kindle.app"
open "/Applications/Meeter.app"
open "/Applications/Notion.app"
open "/Applications/Todoist.app"
open "/Applications/PopClip.app"
open "/Applications/Slack.app"
open "/Applications/zoom.us.app"
if [[ "${PRIVATE}" = "y" ]]; then
    open "/Applications/Discord.app"
    open "/Applications/LINE.app"
    open "/Applications/ScanSnapHomeMain.app"
    sudo xcodebuild -license accept
fi
