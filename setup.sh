#!/bin/bash

set -e

export BECOME_PASS_FILE="/tmp/BECOME_PASS"
GITCLONE_ROOTDIR=$HOME/code/github.com/legnoh/dotfiles

cat << 'EOF'
######################################################################
 _                        _        __  _       _    __ _ _           
| | ___  __ _ _ __   ___ | |__    / /_| | ___ | |_ / _(_) | ___  ___ 
| |/ _ \/ _` | '_ \ / _ \| '_ \  / / _` |/ _ \| __| |_| | |/ _ \/ __|
| |  __/ (_| | | | | (_) | | | |/ / (_| | (_) | |_|  _| | |  __/\__ \
|_|\___|\__, |_| |_|\___/|_| |_/_/ \__,_|\___/ \__|_| |_|_|\___||___/
        |___/                                                        
######################################################################

EOF

# read answers
echo -n "🔐 What's your sudo password?: " && read -s BECOME_PASSWORD
echo ""
echo -n "🎮 Do you need private App? [Y/n]: " && read NEED_PRIVATE
echo -n "🖥️  Do you need GUI Application? [Y/n]: " && read NEED_GUIAPP
echo -n "🛠️  Do you need device driver App? [Y/n]: " && read NEED_DRIVER
export BECOME_PASSWORD
echo "$BECOME_PASSWORD" > $BECOME_PASS_FILE

# Get dotfiles playbook
echo "########### clone dotfiles playbooks ###########"
if [[ ! -d "${GITCLONE_ROOTDIR}" ]]; then
    git clone https://github.com/legnoh/dotfiles.git ${GITCLONE_ROOTDIR}
fi
cd ${GITCLONE_ROOTDIR}

# create skip options
SKIP_TAGS=""
if [[ "${NEED_PRIVATE}" == "n" ]]; then
    SKIP_TAGS="install_private_casks"
fi

if [[ "${NEED_GUIAPP}" == "n" ]]; then
    if [[ "${SKIP_TAGS}" == "" ]]; then
        SKIP_TAGS="gui"
    else
        SKIP_TAGS="${SKIP_TAGS},gui"
    fi
fi

if [[ "${NEED_DRIVER}" == "n" ]]; then
    if [[ "${SKIP_TAGS}" == "" ]]; then
        SKIP_TAGS="device_driver"
    else
        SKIP_TAGS="${SKIP_TAGS},device_driver"
    fi
fi

# Execute
echo "########### execute playbooks ###########"
set +e
if [[ "${SKIP_TAGS}" == "" ]]; then
    ansible-playbook site.yml --become-pass-file="${BECOME_PASS_FILE}"
    result=$?
    rm -rf $BECOME_PASS_FILE
else
    ansible-playbook site.yml --become-pass-file="${BECOME_PASS_FILE}" --skip-tags="${SKIP_TAGS}"
    result=$?
    rm -rf $BECOME_PASS_FILE
fi
set -e

# Finish
echo "========================================================="
if [[ "$result" == "0" ]]; then
    echo "Congrats! Your dotfile operation was done successfully!🎉"
    echo "After gui settings, please reboot your machine:)"
else
    echo "Setup machine process was failed...🫨"
    exit 1
fi
