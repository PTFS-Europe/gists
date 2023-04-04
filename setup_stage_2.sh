#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)" # get current script dir portibly
EPOCH=$(date +%s%N)


## check we are sudo
if [[ "${EUID}" -eq 0 ]]; then
	echo "Please run as non-privileged user"
	exit 1
fi


## get scripts repo
echo "Cloning temporary copy of scripts repo"
git clone git@github.com:PTFS-Europe/scripts.git ${HOME}/scripts
echo "Done"


## pass on to setup_initial_user.sh
echo "Passing on to setup_initial_system.sh"
sudo -E ${HOME}/scripts/sys/setup_initial_system.sh


## say bye
echo "Done! Please now install the relevant application this server is intended"
echo "to run."

echo -ne "VERY IMPORTANT!\n"
cat <<EOF
   ___ _           _     _   _                   _             _   _
  / __| |_  ___ __| |__ | |_| |_  ___   ___ _  _| |_ _ __ _  _| |_| |
 | (__| ' \/ -_) _| / / |  _| ' \/ -_) / _ \ || |  _| '_ \ || |  _|_|
  \___|_||_\___\__|_\_\  \__|_||_\___| \___/\_,_|\__| .__/\_,_|\__(_)
                                                    |_|

... AND THEN ...

  ___     _              _                     _ 
 | _ \___| |__  ___  ___| |_   _ _  _____ __ _| |
 |   / -_) '_ \/ _ \/ _ \  _| | ' \/ _ \ V  V /_|
 |_|_\___|_.__/\___/\___/\__| |_||_\___/\_/\_/(_)

EOF
