#!/bin/bash

DOTDIR=~/code/src/github.com/legnoh/dotfiles

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

# judge M1/Intel
if [[ $(/usr/bin/uname -m) == "arm64" ]]; then
    echo "architecture: M1 Mac"
    HOMEBREW_PREFIX="/opt/homebrew"
else
    echo "architecture: Intel Mac"
    HOMEBREW_PREFIX="/usr/local"
fi
export PATH=${HOMEBREW_PREFIX}/bin:${PATH}

# install Homebrew, bundle, mas
if test ! $(which brew); then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap homebrew/bundle
fi

# install brew packages
${DOTDIR}/etc/macos/install-brew.sh ${PASSWORD} Brewfile &
${DOTDIR}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.cask &
${DOTDIR}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.mas &
if [[ "${PRIVATE}" = "y" ]]; then
    ${DOTDIR}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.private &
fi
wait

# settings

## gitignore
gibo update && gibo dump macOS VisualStudioCode Vim > ~/.gitignore

## crontab
crontab ${DOTDIR}/pkg/crontab.mac

## VSCode settings.json and locale.json
VSCODE_CONF_DIR="~/Library/Application Support/Code/User"
ln -fs ${DOTDIR}/pkg/vsc-settings.json ${VSCODE_CONF_DIR}/settings.json
ln -fs ${DOTDIR}/pkg/vsc-locale.json ${VSCODE_CONF_DIR}/locale.json

## VSCode plugins
code --install-extension bungcip.better-toml
code --install-extension cocopon.iceberg-theme
code --install-extension GitHub.vscode-pull-request-github
code --install-extension ms-azuretools.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-ja
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode.Go
code --install-extension redhat.vscode-yaml
code --install-extension tyriar.sort-lines
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons

## BetterTouchTool
open ${DOTDIR}/pkg

## Quicklook for over Catalina
## FYI: https://github.com/whomwah/qlstephen/issues/98#issuecomment-665375833
xattr -d com.apple.quarantine ~/Library/QuickLook/QLColorCode.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/QLMarkdown.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/QLStephen.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/QuickLookCSV.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/QuickLookJSON.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/WebpQuickLook.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/qlImageSize.qlgenerator

## Docker Completion
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion ${HOMEBREW_PREFIX}/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion ${HOMEBREW_PREFIX}/share/zsh/site-functions/_docker-compose

## PopClip
curl -L http://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz -o /tmp/PasteAndMatch.popclipextz
curl -L http://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz -o /tmp/GoogleTranslate.popclipextz
curl -L https://github.com/legnoh/unixtime-jp.popclipext/releases/download/v1.0/unixtime-jp.zip -o /tmp/unixtime-jp.zip
unzip -o　/tmp/unixtime-jp.zip -d /tmp

## terminal theme
open ${DOTDIR}/pkg/iceberg.terminal

# other gui app setting
open "/Applications/1Password 7.app"
open "/Applications/Alfred 4.app"
open "/Applications/CheatSheet.app"
open "/Applications/Clipy.app"
open "/Applications/Google Chrome.app"
open "/Applications/Notion.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"
if [[ "${PRIVATE}" = "y" ]]; then
    open "/Applications/Discord.app"
    open "/Applications/LINE.app"
    open "/Applications/ScanSnapHomeMain.app"
    open "/Applications/Skype.app"
    open "/Applications/XCode.app"
fi
