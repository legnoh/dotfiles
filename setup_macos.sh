# install command-line-tools
xcode-select --install

# Check for Homebrew,Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

# Add Repository
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap thoughtbot/formulae
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap cloudfoundry/tap

packages=(
  ag
  autoconf
  bash
  cf-cli
  colordiff
  coreutils
  ctags
  curl
  ghq
  gibo
  gist
  git
  gpg2
  hub
  imagemagick
  jq
  libyaml
  libxml2
  markdown
  mcrypt
  mercurial
  mysql
  nkf
  openssh
  openssl
  peco
  pkg-config
  postgres
  proctools
  readline
  rmtrash
  tig
  tree
  wget
  zsh
)

echo "installing binaries..."
brew install ${packages[@]} && brew cleanup

# link
brew link openssl --force
brew link libxml2 --force

# Apps
apps=(
  0xed
  1password
  adapter
  adpassmon
  alfred
  atom
  bettertouchtool
  boot2docker
  cheatsheet
  citrix-receiver
  clipy
  cocoarestclient
  cyberduck
  dash
  dropbox
  evernote
  firefox
  flash
  flip4mac
  flux
  gimp
  github-desktop
  google-chrome
  google-drive
  google-hangouts
  hosts
  java7
  karabiner
  kindle
  licecap
  omnifocus
  omnigraffle
  popclip
  sequel-pro
  skitch
  slack
  sublime-text
  the-unarchiver
  virtualbox
  vagrant
  vagrant-manager
  wireshark
  xerox-print-driver
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# We need to link it
brew cask alfred link

# fonts
fonts=(
  font-m-plus
  font-source-code-pro
  font-clear-sans
  font-roboto
  font-fontawesome
  font-ricty-diminished
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}
