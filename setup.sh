#!/usr/bin/env zsh

set -e

export BECOME_PASS_FILE="/tmp/BECOME_PASS"
GITCLONE_ROOTDIR=$HOME/code/github.com/legnoh/dotfiles
PLAYBOOK="${1:-"site.yml"}"

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
echo -n "🐙 What's your github.com username? [$USER]: " && read GITHUB_USERNAME
echo -n "🎮 Do you need private App? [Y/n]: " && read NEED_PRIVATE
echo -n "🖥️  Do you need GUI Application? [Y/n]: " && read NEED_GUIAPP
echo -n "🛠️  Do you need device driver App? [Y/n]: " && read NEED_DRIVER
export BECOME_PASSWORD
echo "$BECOME_PASSWORD" > $BECOME_PASS_FILE

cat << 'EOF'

######################################################################
                           😎 Gotcha!!!! 😎                           
######################################################################

EOF

# Get dotfiles playbook
echo "# 🌐 Clone dotfiles playbooks..."
if [[ ! -d "${GITCLONE_ROOTDIR}" ]]; then
  git clone https://github.com/legnoh/dotfiles.git ${GITCLONE_ROOTDIR}
  echo "--> 👍 git clone process was successfull!"
else
  echo "--> 👍 git repo has already cloned!"
fi
cd ${GITCLONE_ROOTDIR}
echo ""

# Download Collection
echo "# Download Collection..."
ansible-galaxy collection install --upgrade legnoh.dotfiles
echo "--> 👍 download collection process was successfull!"
echo ""

OPTIONS=("--become-password-file=${BECOME_PASS_FILE}")

# create extra-vars
if [[ "${GITHUB_USERNAME}" != "" ]]; then
  OPTIONS+=("--extra-vars=install_git_packages_github_username=${GITHUB_USERNAME}")
fi

# create skip options
echo "# 🦾 Create skip options..."
SKIP_TAGS=()
if [[ "${NEED_PRIVATE}" == "n" ]]; then
  echo "--> 🙅 SKIP: Private application"
  SKIP_TAGS+=("install_private_casks")
fi
if [[ "${NEED_GUIAPP}" == "n" ]]; then
  echo "--> 🙅 SKIP: GUI application"
  SKIP_TAGS+=("gui")
fi
if [[ "${NEED_DRIVER}" == "n" ]]; then
  echo "--> 🙅 SKIP: Driver application"
  SKIP_TAGS+=("device_driver")
fi
SKIP_TAGS_STR="${(j:,:)SKIP_TAGS}"
if [[ "${SKIP_TAGS_STR}" != "" ]]; then
  OPTIONS+=("--skip-tags=${SKIP_TAGS_STR}")
fi
echo "--> 🫡 OK."
echo ""

# Execute
echo "# 🏃 execute playbooks..."
echo "  --> 📕 Playbook: ${PLAYBOOK}"
echo "  --> 🛠️ Options: ${OPTIONS[@]}"
set +e
ansible-playbook ${PLAYBOOK} "${OPTIONS[@]}"
result=$?
rm -rf $BECOME_PASS_FILE
set -e

echo ""

# Finish
if [[ "$result" == "0" ]]; then
  echo "# 🏁 FINISH!!!"
  echo "🎉🎉🎉 Congrats! Your dotfile operation was done successfully! 🎉🎉🎉"
  echo "🙏 After gui settings, PLEASE REBOOT your machine!!👋"
else
  echo "# 🚨 ERROR..."
  echo "Setup machine process was failed...🫨"
  exit 1
fi
