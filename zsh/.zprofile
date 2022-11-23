if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# commenting out starting gnome_startup.sh
#gnome_startup.sh &

