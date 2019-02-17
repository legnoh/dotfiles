#!/bin/bash

DOT=~/code/src/github.com/legnoh/dotfiles; export DOT
DOT_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOT_GITHUB
DOT_TARBAL="https://codeload.github.com/legnoh/dotfiles/tar.gz/master"; export DOT_TARBAL
DOT_FILES=(
  gnupg/gpg.conf
  gnupg/gpg-agent.conf
  gitconfig
  gitconfig.optional
  vimrc
  zshrc
  zshrc.optional
); export DOT_FILES

# prepare install dotfiles
mkdir -p ~/.gnupg ~/code/bin ~/code/pkg ${DOT}
touch ~/.hushlogin

# install dotfiles by tarball
curl -L "${DOT_TARBAL}" -o /tmp/dotfiles
tar zxvf /tmp/dotfiles -C ${DOT} --strip-components 1
for file in ${DOT_FILES[@]}
do
    ln -fs ${DOT}/dot/${file} ~/.${file}
done

# install multi os utils & apps
if [[ "$(uname)" == 'Darwin' ]]; then
  ${DOT}/etc/macos/setup.sh
fi

# re-install dotfiles by https
rm -rf ${DOT}
git clone ${DOT_GITHUB} ${DOT}

# install *env
/usr/local/bin/anyenv install --init
eval "$(/usr/local/bin/anyenv init -)"
/usr/local/bin/anyenv install jenv
/usr/local/bin/anyenv install nodenv
/usr/local/bin/anyenv install phpenv
/usr/local/bin/anyenv install pyenv
/usr/local/bin/anyenv install rbenv

echo "Complete: please restart Terminal and continue manual settings"
echo "https://github.com/legnoh/dotfiles#manual-setting"
