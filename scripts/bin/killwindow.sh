bash -c 'if [ -z $(pgrep -f "^xdotool selectwindow windowkill$") ]; then xdotool selectwindow windowkill & else pkill -f "^xdotool selectwindow windowkill$"; fi'
