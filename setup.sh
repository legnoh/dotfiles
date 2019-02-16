#!/bin/bash
DOT=~/code/src/github.com/legnoh/dotfiles; export DOT
DOT_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOT_GITHUB
DOT_TARBAL="https://codeload.github.com/legnoh/dotfiles/tar.gz/master"; export DOT_TARBAL
DOT_FILES=(
  gemrc
  gitconfig
  gitconfig.internal
  gnupg/gpg.conf
  gnupg/gpg-agent.conf
  ssh/conf.d/01.basic.conf
  vimrc
  zshrc
  zshrc.optional
); export DOT_FILES

# prepare install dotfile
mkdir -p ~/.ssh/conf.d ~/.gnupg ~/code/bin ~/code/pkg $DOT
touch ~/.hushlogin ~/.ssh/config
ssh-keyscan github.com >> ~/.ssh/known_hosts

# install dotfiles by tarball
curl -L "$DOT_TARBAL" -o /tmp/dotfiles
tar zxvf /tmp/dotfiles -C $DOT --strip-components 1
for file in ${DOT_FILES[@]}
do
    ln -fs $DOT/dot/$file ~/.$file
done

echo "Do you want to change dotfile remote to git protocol? [y/N]: " && read REMOTEPROTOCOL

# install muitl os utils & apps
if [ "$(uname)" == 'Darwin' ]; then
  echo "==> OS: macOS"
  $DOT/etc/macos/setup.sh
fi

# re-install dotfiles by git
rm -rf $DOT
git clone https://github.com/legnoh/dotfiles.git $DOT
if [ "${REMOTEPROTOCOL}" = "y" ]; then
    cd $DOT
    git config --unset-all remote.origin.fetch
    git config --unset-all remote.origin.url
    git remote add origin git@github.com:legnoh/dotfiles.git
    cd -
fi

# install *env
eval "$(~/.anyenv/bin/anyenv init -)"
~/.anyenv/bin/anyenv install jenv
~/.anyenv/bin/anyenv install ndenv
~/.anyenv/bin/anyenv install phpenv
~/.anyenv/bin/anyenv install pyenv
~/.anyenv/bin/anyenv install rbenv

exec $SHELL -l
