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

# install Homebrew, bundle, mas
if test ! $(which brew); then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap homebrew/bundle
fi

# install brew packages
${DOTDIR}/etc/macos/install-brew.sh ${PASSWORD} &
${DOTDIR}/etc/macos/install-cask.sh ${PASSWORD} &
${DOTDIR}/etc/macos/install-mas.sh ${PASSWORD} &
if [[ "${PRIVATE}" = "y" ]]; then
    ${DOTDIR}/etc/macos/install-private.sh ${PASSWORD} &
fi
wait

# settings

## change shell to zsh
sudo sh -c 'echo "¥n/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

## gitignore
/usr/local/bin/gibo update && /usr/local/bin/gibo dump macOS VisualStudioCode Vim > ~/.gitignore

## crontab
crontab ${DOTDIR}/pkg/crontab.mac

## VSCode settings.json and locale.json
ln -fs ${DOTDIR}/pkg/vsc-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -fs ${DOTDIR}/pkg/vsc-locale.json ~/Library/Application\ Support/Code/User/locale.json

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

## CF CLI plugins
cf install-plugin -r CF-Community -f "cfdev"

## BetterTouchTool
open ~/code/src/github.com/legnoh/dotfiles/pkg/Default.bttpreset

## Quicklook for over Catalina
## FYI: https://github.com/whomwah/qlstephen/issues/98#issuecomment-665375833
xattr -d com.apple.quarantine ~/Library/QuickLook/QLStephen.qlgenerator
xattr -d com.apple.quarantine ~/Library/QuickLook/QLMarkdown.qlgenerator

## Docker Completion
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s $etc/docker-machine.zsh-completion /usr/local/share/zsh/site-functions/_docker-machine
ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

## PopClip
curl -L http://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz -o /tmp/PasteAndMatch.popclipextz
curl -L http://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz -o /tmp/GoogleTranslate.popclipextz
curl -L https://github.com/legnoh/unixtime-jp.popclipext/releases/download/v1.0/unixtime-jp.zip -o /tmp/unixtime-jp.zip
unzip /tmp/unixtime-jp.zip -d /tmp

## terminal theme
open ~/code/src/github.com/legnoh/dotfiles/pkg/iceberg.terminal

# other gui app setting
open "/Applications/1Password 7.app"
open "/Applications/Alfred 4.app"
open "/Applications/CheatSheet.app"
open "/Applications/Clipy.app"
open "/Applications/Google Chrome.app"
open "/Applications/Notion.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"
