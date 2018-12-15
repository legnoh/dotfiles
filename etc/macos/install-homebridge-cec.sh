#!/bin/bash

echo "#### Install nodejs..."
ndenv install v10.14.2
ndenv global v10.14.2
ndenv rehash

echo "#### Install homebridge..."
npm -g install homebridge --unsafe-perm
exec $SHELL -l

# install fix branch versions homebridge-cec-accessory
cd ~/.anyenv/envs/ndenv/versions/v10.14.2/lib/node_modules
git clone https://github.com/jbree/homebridge-cec-accessory.git
cd homebridge-cec-accessory
git checkout -b branch-timeout-fix origin/branch-timeout-fix
npm install
cd -

# generate config.json and plist
cp ~/Downloads/mac-homebridge.envrc $DOT/etc/macos/homebridge/.envrc
cd $DOT/etc/macos/homebridge
direnv allow
mkdir -p ~/.homebridge
erb config.json.erb > ~/.homebridge/config.json
erb com.homebridge.server.plist.erb > ~/Library/LaunchAgents/com.homebridge.server.plist
erb com.cecclient.server.plist.erb > ~/Library/LaunchAgents/com.cecclient.server.plist

chmod 700 ~/Library/LaunchAgents
chmod 600 ~/Library/LaunchAgents/com.cecclient.server.plist ~/Library/LaunchAgents/com.homebridge.server.plist

# load
launchctl load ~/Library/LaunchAgents/com.cecclient.server.plist
launchctl start com.cecclient.server

launchctl load ~/Library/LaunchAgents/com.homebridge.server.plist
launchctl start com.homebridge.server
