#!/bin/bash

export GUM_INPUT_PROMPT_FOREGROUND="#0FF"



# location of where settings is stored
SETTING_FILE_PATH="$HOME/bin/ws-manager.settings"

# menu options for add, remove or cd to project
ADD_MARK="add project mark"
REMOVE_MARK="remove project mark"
GO_TO_MARK="go to project mark"

# add a project directory mark
add_proj_mark () {
  if grep -Fq "$1" $SETTING_FILE_PATH; then 
    echo $1 >> $SETTING_FILE_PATH;
    echo "project mark added"
  else
    echo "project was already marked"
  fi
}

# remove project mark
remove_proj_mark () {
  gum confirm && sed -i "/[$1]/d" $SETTING_FILE_PATH | "project mark was not removed"
  echo $1 "project mark removed"
}

# settings
settings () {
  CHOICE=$(gum choose "reset settings" "exit")
}

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
CHOICE=$(gum choose "$ADD_MARK" "$REMOVE_MARK" "$GO_TO_MARK")
# appends the pwd of the project into settings file


if [[ $CHOICE == $ADD_MARK ]]; then
  CURRENTPWD=$(pwd)
  add_proj_mark "$CURRENTPWD"
fi

if [[ $CHOICE == $REMOVE_MARK ]]; then
  REMOVEFILE=$(cat "$SETTING_FILE_PATH" | gum filter)
  remove_proj_mark $REMOVEFILE
fi


