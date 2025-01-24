#!/bin/bash

GITCLONE_ROOTDIR=$HOME/code/github.com/legnoh
export ANSIBLE_BECOME_PASSWORD_FILE="/tmp/ansible_become_password"

# read answers
echo "What's your sudo password?: " && read -sp "Password: " PASSWORD
echo "Do you need private App? [Y/n]: " && read NEED_PRIVATE
echo "Do you need GUI Application? [Y/n]: " && read NEED_GUIAPP
echo "Do you need device driver App? [Y/n]: " && read NEED_DRIVER

# Get dotfiles playbook
echo "########### clone dotfiles playbooks ###########"
mkdir -p ${GITCLONE_ROOTDIR}
cd ${GITCLONE_ROOTDIR}
if [[ ! -d "${GITCLONE_ROOTDIR}/dotfiles" ]]; then
    git clone https://github.com/legnoh/dotfiles.git
fi
cd dotfiles

# create skip options
ANSIBLE_SKIPPED_TAGS=""
if [[ "${NEED_PRIVATE}" == "n" ]]; then
    ANSIBLE_SKIPPED_TAGS="install_private_casks"
fi

if [[ "${NEED_GUIAPP}" == "n" ]]; then
    if [[ "${ANSIBLE_SKIPPED_TAGS}" == "" ]]; then
        ANSIBLE_SKIPPED_TAGS="gui"
    else
        ANSIBLE_SKIPPED_TAGS="${ANSIBLE_SKIPPED_TAGS},gui"
    fi
fi

if [[ "${NEED_DRIVER}" == "n" ]]; then
    if [[ "${ANSIBLE_SKIPPED_TAGS}" == "" ]]; then
        ANSIBLE_SKIPPED_TAGS="device_driver"
    else
        ANSIBLE_SKIPPED_TAGS="${ANSIBLE_SKIPPED_TAGS},device_driver"
    fi
fi

# prepare password file
echo "$PASSWORD" > $ANSIBLE_BECOME_PASSWORD_FILE

# Execute
echo "########### execute playbooks ###########"
if [[ "${ANSIBLE_SKIPPED_TAGS}" == "" ]]; then
    ANSIBLE_BECOME_PASSWORD="${PASSWORD}" ansible-playbook site.yml \
        --become-password-file="${ANSIBLE_BECOME_PASSWORD_FILE}"
else
    ANSIBLE_BECOME_PASSWORD="${PASSWORD}" ansible-playbook site.yml \
        --become-password-file="${ANSIBLE_BECOME_PASSWORD_FILE}" \
        --skip-tags "${ANSIBLE_SKIPPED_TAGS}"
fi

# remove password file
rm -rf $ANSIBLE_BECOME_PASSWORD_FILE

# Finish!
echo "========================================================="
echo "Congrats! Your dotfile operation was done successfully!🎉"
echo "After gui settings, please reboot your machine:)"
