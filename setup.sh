#!/bin/bash

DOT=~/code/src/github.com/legnoh/dotfiles; export DOT
DOT_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOT_GITHUB
DOT_TARBAL="https://codeload.github.com/legnoh/dotfiles/tar.gz/master"; export DOT_TARBAL
DOT_FILES=(
  .gitconfig
  .gitconfig.optional
  .vimrc
  .zshrc
  .zshrc.optional
); export DOT_FILES

# prepare install dotfiles
mkdir -p ~/.gnupg ~/code/bin ~/code/pkg ${DOT}
touch ~/.hushlogin

# install dotfiles by tarball
curl -L "${DOT_TARBAL}" -o /tmp/dotfiles
tar zxvf /tmp/dotfiles -C ${DOT} --strip-components 1
for file in ${DOT_FILES[@]}
do
    ln -fs ${DOT}/dot/${file} ~/${file}
done

# install multi os utils & apps
if [[ "$(uname)" == 'Darwin' ]]; then
  ${DOT}/etc/macos/setup.sh
fi

# re-install dotfiles by https
rm -rf ${DOT}
git clone ${DOT_GITHUB} ${DOT}

# install zplugin
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

echo "Complete: please restart Terminal and continue manual settings"
echo "https://github.com/legnoh/dotfiles#manual-setting"
