#!/usr/bin/env bash

# this is an installer for the cli utility
# backup

# check if .config/backup exists,
# otherwise create it
[ -d "$HOME/.config/backup" ] || { mkdir -p $HOME/.config/backup; touch $HOME/.config/backup/{conf,encryption}; }

[ -d "$HOME/.local/bin" ] || { mkdir -p $HOME/.local/bin; }

optstring=":hue:"
while getopts $optstring name; do
    case $name in
        h) echo "Installer for backup cli utility: -h for help; -e to add encryption id"; exit;;
        e) echo $OPTARG > $HOME/.config/backup/encryption;;
        ?) echo "$OPTARG is not a valid option"; usage; exit 1;;
        :) echo "$OPTARG is not a valid option"; usage; exit 1;;
    esac
done

/usr/bin/cp ./backup $HOME/.local/bin/backup
echo "Installation complete";
