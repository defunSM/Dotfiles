#!/bin/bash

export GUM_INPUT_PROMPT_FOREGROUND="#0FF"

gum style \
	--foreground "#40EDB6" --border-foreground "#40EDB6" --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Workspace Manager'

gum choose $(ls -d .*/ */)
