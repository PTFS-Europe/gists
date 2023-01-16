#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)" # get current script dir portibly


## check we are sudo
if [[ "${EUID}" -eq 0 ]]; then
	echo "Please run as non-privileged user"
	exit 1
fi


## get scripts repo
echo "Cloning temporary copy of scripts repo"
git clone git@github.com:PTFS-Europe/gists.git ${HOME}/scripts
echo "Done"


## pass on to setup_initial_user.sh
echo "Passing on to setup_initial_system.sh"
sudo ${HOME}/scripts/sys/setup_initial_system.sh


## say bye
echo "Done! Please now install the relevant application this server is intended"
echo "to run."
