#!/bin/bash
DOTPATH=~/code/src/github.com/legnoh/dotfiles; export DOTPATH
DOTFILES_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOTFILES_GITHUB
DOTFILES_TARBAL="https://codeload.github.com/legnoh/dotfiles/tar.gz/master"; export DOTFILES_TARBAL
DOT_FILES=(
  gemrc
  gitconfig
  gitconfig.internal
  gnupg/gpg.conf
  gnupg/gpg-agent.conf
  ssh/conf.d/01.basic.conf
  vimrc
  zshrc
); export DOT_FILES

# ssh directory
mkdir -p ~/.ssh/conf.d
touch ~/.ssh/config
ssh-keyscan github.com >> ~/.ssh/known_hosts

# gpg directory
mkdir -p ~/.gnupg

# install dotfiles by tarball
mkdir -p $DOTPATH
curl -L "$DOTFILES_TARBAL" -o /tmp/dotfiles
tar zxvf /tmp/dotfiles -C $DOTPATH --strip-components 1

for file in ${DOT_FILES[@]}
do
    ln -fs $DOTPATH/dot/$file ~/.$file
done

# install muitl os utils & apps
if [ "$(uname)" == 'Darwin' ]; then
  echo "OS: macOS"
  $DOTPATH/etc/setup_macos.sh
elif [ -e /etc/lsb-release ]; then
  echo "OS: Ubuntu"
  $DOTPATH/etc/setup_ubuntu.sh
elif [ -e /etc/redhat-release ]; then
  echo "OS: CentOS"
  $DOTPATH/etc/setup_centos.sh
fi

# hashlogin
touch ~/.hushlogin

# mkdir codepath
mkdir -p ~/code/bin ~/code/pkg ~/code/src

# install anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

# install zplug
git clone https://github.com/zplug/zplug ~/.zplug

# re-install dotfiles by git
rm -rf $DOTPATH
git clone https://github.com/legnoh/dotfiles.git $DOTPATH
printf "Do you want to change dotfile remote to git protocol? [y/N]: " && read ANS
if [ "${ANS}" = "y" ]; then
    cd $DOTPATH
    git config --unset-all remote.origin.fetch
    git config --unset-all remote.origin.url
    git remote add origin git@github.com:legnoh/dotfiles.git
    cd -
fi

# Completed!
printf "Completed! please execute exit, and 'zplug install && rr && $DOTPATH/etc/setup_anyenv.sh"
printf "If you use mac, please execute it: open $ZPLUG_HOME/repos/legnoh/materialshell/materialshell-dark.terminal"
