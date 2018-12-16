#!/bin/bash

echo "#### Install nodejs..."
ndenv install v10.14.2
ndenv global v10.14.2
ndenv rehash

echo "#### Install homebridge..."
npm -g install homebridge --unsafe-perm
npm -g install homebridge-cmdswitch2
exec $SHELL -l

# generate config.json and plist
cp ~/Downloads/mac-bridge.envrc $DOT/etc/macos/homebridge/.envrc
cd $DOT/etc/macos/homebridge
direnv allow
mkdir -p ~/.homebridge
erb config.json.erb > ~/.homebridge/config.json
erb com.homebridge.server.plist.erb > ~/Library/LaunchAgents/com.homebridge.server.plist

chmod 700 ~/Library/LaunchAgents
chmod 600 ~/Library/LaunchAgents/com.homebridge.server.plist

# load
launchctl load ~/Library/LaunchAgents/com.homebridge.server.plist
launchctl start com.homebridge.server
