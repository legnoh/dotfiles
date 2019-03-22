#!/usr/bin/env bash

# set volume to 0
osascript -e "set volume output volume 0"

# play Venice Classic Radio Italia
open -a iTunes -g http://www.veniceclassicradio.eu/live1/128.pls

# raise up to 50
VOLUME=0
while [[ ${VOLUME} -lt 50 ]]
do
  VOLUME=$((${VOLUME} + 1))
  osascript -e "set volume output volume ${VOLUME}"
  sleep 36
done
