################### command-line-tools ###################
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    echo "Installing command-line-tools"
    xcode-select --install
    printf "Completed? [Y/n]: " && read ANS
    if [ "${ANS}" = "n" ]; then
      echo “Stoped...”
      exit 1;
    fi
fi

################### Homebrew ###################
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/bundle
brew bundle --file=~/src/github.com/legnoh/dotfiles/pkg/Brewfile
brew link libxml2 --force
brew link openssl --force

# accept Xcode license
xcodebuild -license accept

################### Mac setting ###################
echo "setting mac..."

### system ###

# 起動音を鳴らす
nvram -d SystemAudioVolume


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

# 「ライブラリ」を常時表示
chflags nohidden ~/Library

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
sudo sh -c 'echo "¥n/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

### TrackPad ###

# タップでクリックを許可
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1


### keyboard ###

# カーソル移動は最速
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15


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
echo "installing Atom packages..."
apm install --packages-file ~/src/github.com/legnoh/dotfiles/pkg/Atomfile


### Eclipse ###
echo "installing Pleiades plugin..."
curl -L http://svn.osdn.jp/svnroot/mergedoc/trunk/Pleiades/build/pleiades.zip -o /tmp/pleiades.zip
mkdir /tmp/pleiades
unzip -q /tmp/pleiades.zip -d /tmp/pleiades

#### eclipse
cp -r /tmp/pleiades/features/* /Applications/Eclipse\ JEE.app/Contents/Eclipse/features/
cp -r /tmp/pleiades/plugins/* /Applications/Eclipse\ JEE.app/Contents/Eclipse/plugins/
echo '-Xverify:none' >> /Applications/Eclipse\ JEE.app/Contents/Eclipse/eclipse.ini
echo '-javaagent:../Eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar' >> /Applications/Eclipse\ JEE.app/Contents/Eclipse/eclipse.ini

#### STS
cp -r /tmp/pleiades/features/* /Applications/STS.app/Contents/Eclipse/features/
cp -r /tmp/pleiades/plugins/* /Applications/STS.app/Contents/Eclipse/plugins/
echo '-Xverify:none' >> /Applications/STS.app/Contents/Eclipse/STS.ini
echo '-javaagent:../Eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar=default.splash' >> /Applications/STS.app/Contents/Eclipse/STS.ini

rm -rf /tmp/pleiades /tmp/pleiades.zip


### CF CLI PLugins ###
echo "installing CF Plugin packages..."
cf install-plugin -r CF-Community -f "doctor"
cf install-plugin -r CF-Community -f "Download Droplet"
cf install-plugin -r CF-Community -f "fastpush"
cf install-plugin -r CF-Community -f "CLI-Recorder"
cf install-plugin -r CF-Community -f "Targets"
cf install-plugin -r CF-Community -f "Statistics"
cf install-plugin -r CF-Community -f "Buildpack Usage"
cf install-plugin -r CF-Community -f "Open"
cf install-plugin -r CF-Community -f "Live Stats"


### Concourse
echo "preparing Concourse Containers...."
ssh-keygen -t rsa -f ~/src/docker/concourse/keys/web/tsa_host_key -N ''
ssh-keygen -t rsa -f ~/src/docker/concourse/keys/web/session_signing_key -N ''
ssh-keygen -t rsa -f ~/src/docker/concourse/keys/worker/worker_key -N ''
cp ~/src/docker/concourse/keys/worker/worker_key.pub ~/src/docker/concourse/keys/web/authorized_worker_keys
cp ~/src/docker/concourse/keys/web/tsa_host_key.pub ~/src/docker/concourse/keys/worker


### Finder と Dock を再起動
echo "restart Finder and Docks..."
kilall Finder
kilall Dock


### Mackup&Dropbox settings ###
open "/Applications/Dropbox.app"
open "/Applications/1Password.app"
ln -fs ~/code/src/github.com/legnoh/dotfiles/dot/mackup.cfg ~/.mackup.cfg


### Dropboxの設定が終わったら、mackupで設定の同期を開始するようガイダンスする
echo "please execute dropbox settings!"
printf "Completed? [Y/n]: " && read ANS
if [ "${ANS}" = "n" ]; then
    echo “Stoped.....”
    exit 1;
fi
echo "Initializing Mackup..."
mackup restore


### インストールしたAppの中で、設定が必要なものを一気に全て開く
echo "Open Apps..."
open "/Applications/Alfred 3.app"
open "/Applications/Bartender 2.app"
open "/Applications/BetterTouchTool.app"
open "/Applications/CheatSheet.app"
open "/Applications/Clipy.app"
open "/Applications/Docker.app"
open "/Applications/FaceTime.app"
open "/Applications/Google Chrome.app"
open "/Applications/GPG Keychain.app"
open "/Applications/Keynote.app"
open "/Applications/Kitematic (Beta).app"
open "/Applications/Kindle.app"
open "/Applications/Numbers.app"
open "/Applications/PopClip.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"


### 環境によって開くかどうか異なる場合は一度聞いてから開く
printf "Do you need setting external App? [y/N]: " && read ANS
if [ "${ANS}" = "y" ]; then
    echo "Open Apps(External)....."
    open "/Applications/Airmail 3.app"
    open "/Applications/BathyScaphe.app"
    open "/Applications/Kobito.app"
    open "/Applications/LINE.app"
    open "/Applications/Skype.app"
    open "/Applications/Tweetbot.app"
fi


### macでは、homebrewのupdateとupgradeを定期時間で常にやるようにする
crontab ~/src/github.com/legnoh/dotfiles/pkg/crontab
