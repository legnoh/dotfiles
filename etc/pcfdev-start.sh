#/bin/bash

mv ~/Downloads/pcfdev-v* /tmp/
unzip -q /tmp/pcfdev-v* -d /tmp
rm -rf /tmp/pcfdev-*.zip

/tmp/pcfdev-*-osx
/usr/local/bin/cf dev start
/usr/local/bin/cf dev trust
rm -rf /tmp/pcfdev-*
