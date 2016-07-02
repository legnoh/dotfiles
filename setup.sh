#!/bin/bash
DOTPATH=~/src/github.com/legnoh/dotfiles; export DOTPATH
DOTFILES_GITHUB="git@github.com:legnoh/dotfiles.git"; export DOTFILES_GITHUB
DOT_FILES=(zshrc zshrc.custom zshrc.alias zshrc.plugin gitconfig gitignore vimrc gemrc ssh/conf.d ssh/config)

# install dotfiles
mkdir -p ~/src/github.com/legnoh
git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"

for file in ${DOT_FILES[@]}
do
    ln -fs ~/src/github.com/legnoh/dotfiles/$file $HOME/.$file
done

# install homebrew and core utils
if [ "$(uname)" == 'Darwin' ]; then
  /usr/bin/xcode-select --install
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  /usr/local/bin/brew tap homebrew/dupes
  /usr/local/bin/brew tap homebrew/versions
  /usr/local/bin/brew tap cloudfoundry/tap
  /usr/local/bin/brew tap legnoh/anyenv
  /usr/local/bin/brew tap caskroom/cask
  /usr/local/bin/brew update
  /usr/local/bin/brew install cf-cli colordiff ctags curl ghq hub mercurial openssl peco tree wget zsh
  /usr/local/bin/brew install anyenv --HEAD
fi

# install zplug
curl -sL get.zplug.sh | zsh

# reload
exec $SHELL -l
