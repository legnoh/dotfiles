#!/bin/bash
DOTPATH=~/code/src/github.com/legnoh/dotfiles; export DOTPATH
DOTFILES_GITHUB="https://github.com/legnoh/dotfiles.git"; export DOTFILES_GITHUB
DOTFILES_TARBAL="https://codeload.github.com/legnoh/dotfiles/tar.gz/master"; export DOTFILES_TARBAL

# prepare install dotfile
mkdir -p ~/.ssh/conf.d ~/.gnupg ~/code/bin ~/code/pkg $DOTPATH
touch ~/.hushlogin ~/.ssh/config
ssh-keyscan github.com >> ~/.ssh/known_hosts

# install dotfiles by tarball
curl -L "$DOTFILES_TARBAL" -o /tmp/dotfiles
tar zxvf /tmp/dotfiles -C $DOTPATH --strip-components 1
for file in $(ls $DOTPATH/dot)
do
    ln -fs $DOTPATH/dot/$file ~/.$file
done

echo -e "\e[35mDo you want to change dotfile remote to git protocol? [y/N]: \e[m" && read REMOTEPROTOCOL

# install muitl os utils & apps
if [ "$(uname)" == 'Darwin' ]; then
  echo -e "\e[34mOS: macOS\e[m"
  $DOTPATH/etc/macos/setup.sh
elif [ -e /etc/lsb-release ]; then
  echo -e "\e[34mOS: Ubuntu\e[m"
  $DOTPATH/etc/ubuntu/setup.sh
elif [ -e /etc/redhat-release ]; then
  echo -e "\e[34mOS: CentOS\e[m"
  $DOTPATH/etc/centos/setup.sh
fi

# install anyenv & zplug
git clone https://github.com/riywo/anyenv ~/.anyenv
git clone https://github.com/zplug/zplug ~/.zplug

# re-install dotfiles by git
rm -rf $DOTPATH
git clone https://github.com/legnoh/dotfiles.git $DOTPATH
if [ "${REMOTEPROTOCOL}" = "y" ]; then
    cd $DOTPATH
    git config --unset-all remote.origin.fetch
    git config --unset-all remote.origin.url
    git remote add origin git@github.com:legnoh/dotfiles.git
    cd -
fi

echo -e "\e[32mCompleted! please execute exit, and 'zplug install && rr && $DOTPATH/etc/setup_anyenv.sh\e[m"
echo -e "\e[35mIf you use mac, please execute it: open $ZPLUG_HOME/repos/legnoh/materialshell/materialshell-dark.terminal\e[m"
