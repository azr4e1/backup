#!/usr/bin/env bash

# this is an installer for the cli utility
# backup

# check if .config/backup exists,
# otherwise create it
[ -d "$HOME/.config/backup" ] || { mkdir -p $HOME/.config/backup; touch $HOME/.config/backup/conf; }

optstring=":hu"
while getopts $optstring name; do
    case $name in
        h) echo "Installer for backup cli utility: -h for help; -u to install as user"; exit;;
        u) /usr/bin/cp ./backup $HOME/.local/bin/backup && echo "Installation complete"; exit;;
        *) echo "$OPTARG is not a valid option"; usage; exit 1;;
    esac
done

# install it
sudo /usr/bin/cp ./backup /usr/bin/backup
echo "Installation complete"
