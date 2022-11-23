#
# 'xinput list' to display all xinput devices
# This script will map the HUION tablet drawing area to a monitor
# This script relies on digimend-kernel-drivers-dkms

xinput map-to-output 'HUION Huion Tablet stylus' HDMI-A-0

# This maps keybindings to the buttons on the tablet
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 1 "key +ctrl +z -z -ctrl"
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 2 "key e"
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 3 "key b"
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 8 "key +"
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 9 "key -"
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 10 "key ]"
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 11 "key ["
xsetwacom --set 'HUION Huion Tablet Pad pad' Button 12 "key p"
