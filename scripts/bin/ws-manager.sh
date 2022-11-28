#!/bin/bash

export GUM_INPUT_PROMPT_FOREGROUND="#0FF"

# location of where settings is stored
SETTING_FILE_PATH="$HOME/bin/ws-manager.settings"

# create the settings file if it doesn't exist
if [[ ! -e $SETTING_FILE_PATH ]]; then
  touch $SETTING_FILE_PATH
fi

# displays a nice green border when executing ws-manager
gum style \
	--foreground "#40EDB6" --border-foreground "#40EDB6" --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Workspace Manager'

# adds,removes or cd to the project
CHOICE=$(gum choose "add project folder" "remove project folder" "go to project")
echo $CHOICE
# appends the pwd of the project into settings file
if [[$CHOICE -eq "add project folder"]]; then
  CURRENT_PWD=$(pwd)
  echo $CURRENT_PWD > $SETTING_FILE_PATH
fi


