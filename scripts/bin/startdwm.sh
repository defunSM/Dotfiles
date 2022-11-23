#!/usr/bin/env bash

# https://wiki.archlinux.org/title/Dwm#Restart_dwm
# Enables the restart of dwm when patching and not lose any X windows

# while true; do
#     # Log stderror to a file
#     dwm 2> ~/.dwm.log
#     # No error logging
#     #dwm >/dev/null 2>&1
# done


# Starts the graphical environment
#exec dwm

# ------------- Starting Applications ------------

# Sets the background
~/.fehbg &

# Opens brave web browser
brave &

# Opens terminal
alacritty &

# Opens emacs text editor
emacs &

# Starts redshift to help reduce eye strain at night
redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"') &

# Starts gpu/cpu monitoring
corectrl &

# Starts steam
steam-runtime &

# virtual manager for vms
virt-manager &

# Picom is a compositor that makes the graphical env look pretty
picom --experimental-backend &

# Screenshot program
flameshot &

dwm
