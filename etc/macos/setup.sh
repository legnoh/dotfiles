# read answers
echo -e "\e[35mDo you need private App? [y/N]: \e[m" && read PRIVATE
echo -e "\e[35mWhat's your sudo password?: \e[m" && read -sp "Password: " PASSWORD

# command-line-tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    echo "\e[34mInstalling command-line-tools\e[m"
    xcode-select --install
    echo -e "\e[35mCompleted? [Y/n]: \e[m" && read ANS
    if [ "${ANS}" = "n" ]; then
      echo “Stoped...”
      exit 1;
    fi
fi

# Homebrew
if test ! $(which brew); then
    echo "\e[34mInstalling homebrew...\e[m"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap homebrew/bundle
brew install mas

# install xcode and accept license
mas install 497799835
~/code/src/github.com/legnoh/dotfiles/etc/macos/accept-license.sh $PASSWORD

# brew, cask, mas
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-brew.sh $PASSWORD &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-cask.sh $PASSWORD &
~/code/src/github.com/legnoh/dotfiles/etc/macos/install-mas.sh $PASSWORD &
if [ "${PRIVATE}" = "y" ]; then
    ~/code/src/github.com/legnoh/dotfiles/etc/macos/install-private.sh $PASSWORD &
fi

wait

# install apm package
apm install --packages-file ~/code/src/github.com/legnoh/dotfiles/pkg/Atomfile &

# settings
## 「ライブラリ」を常時表示
chflags nohidden ~/Library

## ログインシェルをHomebrew版Zshに変更する(後で再起動する)
sudo sh -c 'echo "¥n/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

## homebrewのupdateとupgradeを定期時間で常にやるようにする
crontab ~/code/src/github.com/legnoh/dotfiles/pkg/crontab

# Pleiades
echo "\e[34minstalling Pleiades plugin...\e[m"
curl -L http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/build/stable/pleiades-mac.zip -o /tmp/pleiades.zip
mkdir /tmp/pleiades
unzip -q /tmp/pleiades.zip -d /tmp/pleiades

## eclipse
cp -r /tmp/pleiades/features/* /Applications/Eclipse\ JEE.app/Contents/Eclipse/features/
cp -r /tmp/pleiades/plugins/* /Applications/Eclipse\ JEE.app/Contents/Eclipse/plugins/
echo '-Xverify:none' >> /Applications/Eclipse\ JEE.app/Contents/Eclipse/eclipse.ini
echo '-javaagent:../Eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar' >> /Applications/Eclipse\ JEE.app/Contents/Eclipse/eclipse.ini

## STS
cp -r /tmp/pleiades/features/* /Applications/STS.app/Contents/Eclipse/features/
cp -r /tmp/pleiades/plugins/* /Applications/STS.app/Contents/Eclipse/plugins/
echo '-Xverify:none' >> /Applications/STS.app/Contents/Eclipse/STS.ini
echo '-javaagent:../Eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar=default.splash' >> /Applications/STS.app/Contents/Eclipse/STS.ini
rm -rf /tmp/pleiades /tmp/pleiades.zip

# CF CLI PLugins
echo "\e[34minstalling CF Plugin packages...\e[m"
cf install-plugin -r CF-Community -f "Download Droplet"
cf install-plugin -r CF-Community -f "Open"
cf install-plugin -r CF-Community -f "Usage Report"
cf install-plugin -r CF-Community -f "bg-restage"
cf install-plugin -r CF-Community -f "doctor"
cf install-plugin -r CF-Community -f "fastpush"
cf install-plugin -r CF-Community -f "service-use"
cf install-plugin -r CF-Community -f "top"

# Concourse
echo "\e[34mpreparing Concourse Containers....\e[m"
ssh-keygen -t rsa -f ~/code/src/docker/concourse/keys/web/tsa_host_key -N ''
ssh-keygen -t rsa -f ~/code/src/docker/concourse/keys/web/session_signing_key -N ''
ssh-keygen -t rsa -f ~/code/src/docker/concourse/keys/worker/worker_key -N ''
cp ~/code/src/docker/concourse/keys/worker/worker_key.pub ~/code/src/docker/concourse/keys/web/authorized_worker_keys
cp ~/code/src/docker/concourse/keys/web/tsa_host_key.pub ~/code/src/docker/concourse/keys/worker

### インストールしたAppの中で、設定が必要なものを一気に全て開く
echo "\e[34mOpen Apps...\e[m"
open "/Applications/Dropbox.app"
open "/Applications/1Password.app"
open "/Applications/Alfred 3.app"
open "/Applications/Bartender 3.app"
open "/Applications/BetterTouchTool.app"
open "/Applications/CheatSheet.app"
open "/Applications/Clipy.app"
open "/Applications/Docker.app"
open "/Applications/FaceTime.app"
open "/Applications/Google Chrome.app"
open "/Applications/GPG Keychain.app"
open "/Applications/Kitematic (Beta).app"
open "/Applications/PopClip.app"
open "/Applications/Slack.app"
open "/Applications/The Unarchiver.app"
if [ "${PRIVATE}" = "y" ]; then
    open "/Applications/BathyScaphe.app"
    open "/Applications/Evernote.app"
    open "/Applications/Kobito.app"
    open "/Applications/LINE.app"
    open "/Applications/Skype.app"
    open "/Applications/Tweetbot.app"
    open "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app"
    open "/Applications/Wacom Tablet.localized/Wacom Desktop Center.app"
fi

wait
