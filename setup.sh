#!/bin/bash
DOTPATH=~/src/github.com/legnoh/dotfiles; export DOTPATH
DOTFILES_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOTFILES_GITHUB
DOTFILES_TARBAL="https://github.com/legnoh/dotfiles/archive/master.tar.gz"; export DOTFILES_TARBAL
DOT_FILES=(
  gemrc
  gitconfig
  gitconfig.external
  gitconfig.internal
  gitignore
  gnupg/gpg.conf
  gnupg/gpg-agent.conf
  ssh/conf.d/01.basic.conf
  vimrc
  zshenv
  zshrc
  zshrc.alias
  zshrc.custom
  zshrc.plugin
); export DOT_FILES

# ssh directory
mkdir -p ~/.ssh/conf.d
touch ~/.ssh/config
ssh-keyscan github.com >> ~/.ssh/known_hosts

# gpg directory
mkdir -p ~/.gnupg

# install dotfiles
mkdir -p ~/src/github.com/legnoh
cd /tmp && curl -LO $DOTFILES_TARBALL
tar zxf /tmp/master.tar.gz
mv /tmp/dotfiles-master $DOTPATH

for file in ${DOT_FILES[@]}
do
    ln -fs ~/src/github.com/legnoh/dotfiles/$file ~/.$file
done

# install muitl os utils & apps
if [ "$(uname)" == 'Darwin' ]; then
  echo "OS: macOS"
  ~/src/github.com/legnoh/dotfiles/setup_macos.sh
elif [ -e /etc/lsb-release ]; then
  echo "OS: Ubuntu"
  ~/src/github.com/legnoh/dotfiles/setup_ubuntu.sh
elif [ -e /etc/redhat-release ]; then
  echo "OS: CentOS"
  ~/src/github.com/legnoh/dotfiles/setup_centos.sh
fi

# install anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

# install zplug
git clone https://github.com/zplug/zplug ~/.zplug

# reload
exec $SHELL -l
source ~/.zshrc
zplug install

# git config to dotfiles
cd $DOTPATH && git remote add origin https://github.com/legnoh/dotfiles.git

# install *env
~/src/github.com/legnoh/dotfiles/setup_anyenv.sh
