#!/bin/bash
DOTPATH=~/src/github.com/legnoh/dotfiles; export DOTPATH
DOTFILES_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOTFILES_GITHUB
DOT_FILES=(zshrc zshrc.custom zshrc.alias zshrc.plugin zshenv gitconfig gitignore vimrc gemrc ssh/conf.d ssh/config)

# ssh directory
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts

# install dotfiles
mkdir -p ~/src/github.com/legnoh
git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"

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
curl -sL get.zplug.sh | zsh
echo "please exec 'zplug install'"
