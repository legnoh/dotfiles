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
  mysql --client-only
  nkf
  openssh
  openssl
  peco
  pkg-config
  postgres --client-only
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

################### Mac設定 ###################

### finder ###

# アピアランスをブルーに
defaults write -g AppleAquaColorVariant -int 1

# メニューバーと Dock を暗くする
defaults write -g AppleInterfaceStyle -string "Dark"

# 強調表示色をブルーに
defaults write -g AppleHighlightColor -string "0.764700 0.976500 0.568600"

# サイドバーのアイコンサイズを中に
defaults write -g NSTableViewDefaultSizeMode -int 1

# スクロールバーは自動表示に任せる
defaults write -g AppleShowScrollBars -string "Automatic"

# スクロールバーのクリック時にクリックされた場所へジャンプ
defaults write -g AppleScrollerPagingBehavior -bool true

# 使用可能な場合は LCD で滑らかな文字を使用
defaults -currentHost write -g AppleFontSmoothing -int 0


### Dock ###

# デフォルトサイズを64pxに
defaults write com.apple.dock tilesize -int 64

# 拡大をONにして128pxに拡大
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 128

# 下に表示する
defaults write com.apple.dock orientation -string "bottom"

# 自動的に隠す
defaults write com.apple.dock autohide -bool true

# スケールエフェクトにする
defaults write com.apple.dock mineffect -string "scale"

# ダブルクリックでしまう
defaults write -g AppleMiniaturizeOnDoubleClick -bool true

# ウィンドウをアプリケーションアイコンにしまう
defaults write com.apple.dock minimize-to-application -bool true

# 起動中アプリをジャンプ表示
defaults write com.apple.dock launchanim -bool false

# インジケータを表示
defaults write com.apple.dock show-process-indicators -bool true


### MissionControl / Dashboard ###

# 並べ替えはしない
defaults write com.apple.dock mru-spaces -bool false

# アプリの開いているスペースに移動
defaults write -g AppleSpacesSwitchOnActivate -bool true

# グループ化する
defaults write com.apple.dock expose-group-by-app -bool true

# ディスプレイごとに個別の操作スペースを設定
defaults write com.apple.spaces spans-displays -bool true

# DashboardをOFFにする
defaults write com.apple.dashboard enabled-state -int 1


### Security / Personal ###

# MacAppStoreと開発元のわかるAppのみ実行可能にする
sudo spctl --master-enable

# FileVaultをONにする
sudo defaults write /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin -bool true

# ファイアウォールをONにする
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# 署名されたソフトウェアが外部からの接続を受け入れるのを自動的に許可する
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -int 1

# ステルスモードを有効にする
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# ログインシェルをHomebrew版Zshに変更する(後で再起動する)
chsh -s /usr/local/bin/zsh

### TrackPad ###

# タップでクリックを許可
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1


### keyboard ###

#　カーソル移動は最速
defaults write -g KeyRepeat -int 0
defaults write -g InitialKeyRepeat -int 0


### Safari ###

# debug・開発を有効化
defaults write com.apple.Safari IncludeInternalDebugMenu 1
defaults write com.apple.Safari IncludeDevelopMenu 1

# 最後に開いていた項目を表示
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch 1

# タブバーを常に表示
defaults write com.apple.Safari AlwaysShowTabBar 1
defaults write com.apple.Safari AlwaysShowTabBarInFullScreen 1

### Shortcut ###
# 今はまだ


### Atom.io ###
atompackage=(
  atom-material-syntax
  atom-material-ui
  autocomplete-go
  builder-go
  color-picker
  environment
  file-icons
  genesis-ui
  git-plus
  git-status
  gitignore-snippets
  go-config
  go-get
  go-plus
  gofmt
  gometalinter-linter
  gorename
  haskell-grammar
  highlight-selected
  japanese-menu
  language-babel
  language-ini
  language-plantuml
  language-thrift
  linter
  merge-conflicts
  minimap
  navigator-godef
  nuclide
  php-cs-fixer
  plantuml-viewer
  project-manager
  project-view
  sort-lines
  terminal-plus
  tester-go
  tool-bar
)

echo "installing Atom packages..."
/usr/local/bin/apm install ${atompackage[@]}

### CF CLI PLugins ###
cf install-plugin -r CF-Community -f "doctor"
cf install-plugin -r CF-Community -f "Download Droplet"
cf install-plugin -r CF-Community -f "fastpush"
cf install-plugin -r CF-Community -f "CLI-Recorder"
cf install-plugin -r CF-Community -f "Targets"
cf install-plugin -r CF-Community -f "Statistics"
cf install-plugin -r CF-Community -f "Buildpack Usage"
cf install-plugin -r CF-Community -f "Open"
cf install-plugin -r CF-Community -f "Live Stats"


##### Finder と Dock を再起動
kilall Finder
kilall Dock


### インストールしたAppの中で、設定が必要なものを一気に全て開く
open "/Applications/1Password 6.app"
open "/Applications/ADPassMon.app"
open "/Applications/Alfred 3.app"
open "/Applications/Atom.app"
open "/Applications/BetterTouchTool.app"
open "/Applications/CheatSheet.app"
open "/Applications/Citrix Receiver.app"
open "/Applications/Clipy.app"
open "/Applications/Cyberduck.app"
open "/Applications/Dash.app"
open "/Applications/Dropbox.app"
open "/Applications/Evernote.app"
open "/Applications/FaceTime.app"
open "/Applications/Flux.app"
open "/Applications/GitHub Desktop.app"
open "/Applications/Google Chrome.app"
open "/Applications/Google Drive.app"
open "/Applications/Karabiner.app"
open "/Applications/Kindle.app"
open "/Applications/OmniFocus.app"
open "/Applications/OmniGraffle.app"
open "/Applications/Popclip.app"
open "/Applications/Safari.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"
