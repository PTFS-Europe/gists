#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)" # get current script dir portibly


## check we are sudo
if [[ "${EUID}" -ne 0 ]]; then
	echo "Please run as root (or sudo)."
	exit 1
fi


## update apt repos
echo "Updating and upgrading packages . . . "
apt update >/dev/null 2>&1 ; apt upgrade -y
echo "Done"


## install base packages
echo "Installing base packages . . . "
apt update >/dev/null 2>&1 ; apt install -y \
  git \
  curl \
  wget \
  htop \
  ncdu
echo "Done"


## get scripts repo
echo "Cloning temporary copy of scripts repo"
git clone git@github.com:PTFS-Europe/scripts.git /tmp/scripts
echo "Done"


## pass on to setup_initial_user.sh
echo "Passing on to setup_initial_user.sh"
/tmp/scripts/sys/setup_initial_user.sh
echo "Done"


## tidyup
echo "Tidying up /tmp"
rm -rf /tmp/scripts
echo "Done"


## say bye
echo "We have gotten as far as we can! Please now ssh into the new user"
echo "and run the following command to continue:"
echo "$ wget -qO - https://raw.githubusercontent.com/PTFS-Europe/gists/main/setup_stage_2.sh | bash -"
