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

    # sudo touch id setting in sonoma
    # https://dev.to/siddhantkcode/enable-touch-id-authentication-for-sudo-on-macos-sonoma-14x-4d28
    sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
else
    echo "architecture: Intel Mac"
    HOMEBREW_PREFIX="/usr/local"
fi
export PATH=${HOMEBREW_PREFIX}/bin:${PATH}

# install Homebrew(with CommandLineTools)
if test ! $(which brew); then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap homebrew/bundle
fi

# install brew packages
${DOT}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.brew.rb &
${DOT}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.cask.rb &
${DOT}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.mas.rb &
if [[ "${PRIVATE}" = "y" ]]; then
    ${DOT}/etc/macos/install-brew.sh ${PASSWORD} Brewfile.private.rb &
fi
wait

# settings

## gitignore
gibo update && gibo dump macOS VisualStudioCode Vim > ~/.gitignore

## crontab
crontab ${DOT}/pkg/crontab.mac

## VSCode settings.json and locale.json
VSCODE_CONF_DIR=~/Library/Application\ Support/Code/User
ln -fs ${DOT}/pkg/vsc-settings.json ${VSCODE_CONF_DIR}/settings.json
ln -fs ${DOT}/pkg/vsc-locale.json ${VSCODE_CONF_DIR}/locale.json

## VSCode plugins
code --install-extension astro-build.astro-vscode
code --install-extension cocopon.iceberg-theme
code --install-extension github.vscode-github-actions
code --install-extension github.vscode-pull-request-github
code --install-extension golang.go
code --install-extension hashicorp.terraform
code --install-extension hrst.yamaha-rt
code --install-extension hrst.yamaha-wlx
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-ceintl.vscode-language-pack-ja
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-python.python
code --install-extension ms-vscode-remote.remote-containers
code --install-extension redhat.vscode-yaml
code --install-extension sswg.swift-lang
code --install-extension tamasfe.even-better-toml
code --install-extension tyriar.sort-lines
code --install-extension unifiedjs.vscode-mdx
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons

## PopClip
curl -L https://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz -o /tmp/PasteAndMatch.popclipextz
curl -L https://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz -o /tmp/GoogleTranslate.popclipextz
curl -L https://pilotmoon.com/popclip/extensions/ext/UnixTime.popclipextz -o /tmp/UnixTime.popclipextz

## terminal theme
open ${DOT}/pkg/iceberg.terminal

# xcode licence agreement
sudo xcodebuild -license accept

# open gui installers
open "${HOMEBREW_PREFIX}/Caskroom/logi-options-plus/latest/logioptionsplus_installer.app"

# other gui app setting
open "/Applications/1Password.app"
open "/Applications/Alfred 5.app"
open "/Applications/Kindle.app"
open "/Applications/Notion.app"
open "/Applications/PopClip.app"
open "/Applications/Slack.app"
if [[ "${PRIVATE}" = "y" ]]; then
    open "/Applications/Discord.app"
fi
