#!/usr/bin/env bash

# set volume to 50
osascript -e "set volume output volume 50"

# play Venice Classic Radio Italia
open -a iTunes -g http://www.veniceclassicradio.eu/live1/128.pls

# reduced to 0
VOLUME=50
while [[ ${VOLUME} -gt 0 ]]
do
  VOLUME=$((${VOLUME} - 1))
  osascript -e "set volume output volume ${VOLUME}"
  sleep 72
done

# stop Radio
osascript -e 'tell application "iTunes" to stop'
